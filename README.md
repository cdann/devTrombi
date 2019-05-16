# DevTrombi

The trombinoscope of the developers.

## Architecture

## Services
Here is the ApiService. It is an intermediate between Alamofire and the Application. 
It follows a protocol, it is simplest to test the application that way.

## Models
The only model manipulated here is the object developer. It is the object used to fill the tableview then the detail view.

## Containers
The containers calls the ApiService to get the developers data and fill the Developers Objects. 
It uses its delegate to show its progress or to complete the request. The delegate function could have better names (ex: loadDevCompleted, loadDevInProgress)
The container would be tested by implementing a fake ApiService and a fake delegate. The transformation of the data would be tested.

## Controllers
The first ViewController is the tableViewController: it is the list of all the devs the api send. It calls the developerContainer to load the developers.
It is its delegate, that way the tableveiew controller can show an error if there is an error, the progress while the request and reload the tableview once the developers have been loaded. 
It would be tested by implementing a fake container.

The second conroller is the detailViewController: it displays the informations of the selected developer. The labels are filled with the datas in the devContainer for the dev selected. In the future, the controller would call the container to load the image. A spinning wheel would be displayed while the request.
It would be tested by implementing a faks container.

An extension of the UIViewController is implemented to show alert when there is an error.




