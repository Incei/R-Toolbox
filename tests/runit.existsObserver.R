require(RUnit, quietly=TRUE)
require(MoBiToolboxForR, quietly=TRUE)
simModelXML <- "./models/black american girl.xml"
standard_dci_info <- initSimulation(XML=simModelXML, whichInitParam="none")

test.EmptyPathID <- function() {
  dci_info <- standard_dci_info
  checkException(existsObserver(path_id="", DCI_Info = dci_info))
}

test.EmptyDCI_Info <- function() {
  checkException(existsObserver(path_id=97, DCI_Info = {}))
}

test.CheckParameterInSimulation <- function() {
  dci_info <- standard_dci_info
  options <- list(Type="readonly")
  
  check <- existsObserver(path_id=97, DCI_Info = dci_info, options=options)
  checkTrue(check$isExisting)
  checkEquals(check$ID, 97)
  checkEquals(check$ID, dci_info$InputTab$AllObservers$ID[check$Index])
  checkEquals(check$Path, dci_info$InputTab$AllObservers$Path[check$Index])
  
  options <- list(Type="readonly")
  check <- existsObserver(path_id=109, DCI_Info = dci_info, options=options)
  checkTrue(check$isExisting)
  checkEquals(check$ID, 109)
  checkEquals(check$ID, dci_info$InputTab$AllObservers$ID[check$Index])
  checkEquals(check$Path, dci_info$InputTab$AllObservers$Path[check$Index])
  
}

test.CheckParameterInSimulationNonevariables <- function() {
  dci_info <- standard_dci_info
  options <- list(Type="readonly")
  check <- existsObserver(path_id=97, DCI_Info = dci_info, options=options)
  checkTrue(check$isExisting)
  checkEquals(check$ID, 97)
  checkEquals(check$ID, dci_info$InputTab$AllObservers$ID[check$Index])
  checkEquals(check$Path, dci_info$InputTab$AllObservers$Path[check$Index])
}

test.CheckParameterInSimulationNonevariablesIsReference <- function() {
  dci_info <- standard_dci_info
  options <- list(Type="readonly", isReference=TRUE)
  check <- existsObserver(path_id=97, DCI_Info = dci_info, options = options)
  checkTrue(check$isExisting)
  checkEquals(check$ID, 97)
  checkEquals(check$ID, dci_info$InputTab$AllObservers$ID[check$Index])
  checkEquals(check$Path, dci_info$InputTab$AllObservers$Path[check$Index])
}

