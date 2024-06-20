; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57570 () Bool)

(assert start!57570)

(declare-fun b!263940 () Bool)

(declare-fun e!184115 () Bool)

(assert (=> b!263940 (= e!184115 true)))

(declare-fun lt!405321 () Bool)

(declare-datatypes ((array!14723 0))(
  ( (array!14724 (arr!7411 (Array (_ BitVec 32) (_ BitVec 8))) (size!6424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11662 0))(
  ( (BitStream!11663 (buf!6892 array!14723) (currentByte!12756 (_ BitVec 32)) (currentBit!12751 (_ BitVec 32))) )
))
(declare-fun lt!405323 () BitStream!11662)

(declare-fun w1!584 () BitStream!11662)

(declare-fun isPrefixOf!0 (BitStream!11662 BitStream!11662) Bool)

(assert (=> b!263940 (= lt!405321 (isPrefixOf!0 lt!405323 w1!584))))

(declare-fun b!263941 () Bool)

(declare-fun e!184114 () Bool)

(assert (=> b!263941 (= e!184114 e!184115)))

(declare-fun res!220734 () Bool)

(assert (=> b!263941 (=> res!220734 e!184115)))

(declare-fun e!184108 () Bool)

(assert (=> b!263941 (= res!220734 e!184108)))

(declare-fun res!220732 () Bool)

(assert (=> b!263941 (=> (not res!220732) (not e!184108))))

(assert (=> b!263941 (= res!220732 (not (= (size!6424 (buf!6892 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18803 0))(
  ( (Unit!18804) )
))
(declare-fun lt!405320 () Unit!18803)

(declare-fun e!184107 () Unit!18803)

(assert (=> b!263941 (= lt!405320 e!184107)))

(declare-fun c!12078 () Bool)

(assert (=> b!263941 (= c!12078 (not (= (size!6424 (buf!6892 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263942 () Bool)

(declare-fun e!184109 () Bool)

(declare-fun w2!580 () BitStream!11662)

(declare-fun array_inv!6148 (array!14723) Bool)

(assert (=> b!263942 (= e!184109 (array_inv!6148 (buf!6892 w2!580)))))

(declare-fun b!263943 () Bool)

(declare-fun lt!405322 () Unit!18803)

(assert (=> b!263943 (= e!184107 lt!405322)))

(declare-fun lt!405319 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263943 (= lt!405319 (bitIndex!0 (size!6424 (buf!6892 w1!584)) (currentByte!12756 w1!584) (currentBit!12751 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14723 array!14723 (_ BitVec 64) (_ BitVec 64)) Unit!18803)

(assert (=> b!263943 (= lt!405322 (arrayBitRangesEqSymmetric!0 (buf!6892 w1!584) (buf!6892 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405319))))

(declare-fun arrayBitRangesEq!0 (array!14723 array!14723 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263943 (arrayBitRangesEq!0 (buf!6892 w2!580) (buf!6892 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405319)))

(declare-fun b!263944 () Bool)

(declare-fun Unit!18805 () Unit!18803)

(assert (=> b!263944 (= e!184107 Unit!18805)))

(declare-fun b!263945 () Bool)

(declare-fun e!184110 () Bool)

(assert (=> b!263945 (= e!184110 (array_inv!6148 (buf!6892 w1!584)))))

(declare-fun b!263946 () Bool)

(declare-fun e!184111 () Bool)

(assert (=> b!263946 (= e!184111 (not (arrayBitRangesEq!0 (buf!6892 w1!584) (buf!6892 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6424 (buf!6892 w1!584)) (currentByte!12756 w1!584) (currentBit!12751 w1!584)))))))

(declare-fun b!263947 () Bool)

(declare-fun e!184113 () Bool)

(assert (=> b!263947 (= e!184113 (not e!184114))))

(declare-fun res!220735 () Bool)

(assert (=> b!263947 (=> res!220735 e!184114)))

(assert (=> b!263947 (= res!220735 e!184111)))

(declare-fun res!220733 () Bool)

(assert (=> b!263947 (=> (not res!220733) (not e!184111))))

(assert (=> b!263947 (= res!220733 (not (= (size!6424 (buf!6892 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263947 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405316 () Unit!18803)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11662) Unit!18803)

(assert (=> b!263947 (= lt!405316 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!263947 (isPrefixOf!0 lt!405323 lt!405323)))

(declare-fun lt!405317 () Unit!18803)

(assert (=> b!263947 (= lt!405317 (lemmaIsPrefixRefl!0 lt!405323))))

(assert (=> b!263947 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405318 () Unit!18803)

(assert (=> b!263947 (= lt!405318 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263947 (= lt!405323 (BitStream!11663 (buf!6892 w2!580) (currentByte!12756 w1!584) (currentBit!12751 w1!584)))))

(declare-fun res!220731 () Bool)

(assert (=> start!57570 (=> (not res!220731) (not e!184113))))

(assert (=> start!57570 (= res!220731 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57570 e!184113))

(declare-fun inv!12 (BitStream!11662) Bool)

(assert (=> start!57570 (and (inv!12 w1!584) e!184110)))

(assert (=> start!57570 (and (inv!12 w2!580) e!184109)))

(declare-fun b!263948 () Bool)

(assert (=> b!263948 (= e!184108 (not (arrayBitRangesEq!0 (buf!6892 w2!580) (buf!6892 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6424 (buf!6892 w1!584)) (currentByte!12756 w1!584) (currentBit!12751 w1!584)))))))

(assert (= (and start!57570 res!220731) b!263947))

(assert (= (and b!263947 res!220733) b!263946))

(assert (= (and b!263947 (not res!220735)) b!263941))

(assert (= (and b!263941 c!12078) b!263943))

(assert (= (and b!263941 (not c!12078)) b!263944))

(assert (= (and b!263941 res!220732) b!263948))

(assert (= (and b!263941 (not res!220734)) b!263940))

(assert (= start!57570 b!263945))

(assert (= start!57570 b!263942))

(declare-fun m!394307 () Bool)

(assert (=> b!263947 m!394307))

(declare-fun m!394309 () Bool)

(assert (=> b!263947 m!394309))

(declare-fun m!394311 () Bool)

(assert (=> b!263947 m!394311))

(declare-fun m!394313 () Bool)

(assert (=> b!263947 m!394313))

(declare-fun m!394315 () Bool)

(assert (=> b!263947 m!394315))

(declare-fun m!394317 () Bool)

(assert (=> b!263947 m!394317))

(declare-fun m!394319 () Bool)

(assert (=> b!263946 m!394319))

(assert (=> b!263946 m!394319))

(declare-fun m!394321 () Bool)

(assert (=> b!263946 m!394321))

(declare-fun m!394323 () Bool)

(assert (=> b!263942 m!394323))

(assert (=> b!263948 m!394319))

(assert (=> b!263948 m!394319))

(declare-fun m!394325 () Bool)

(assert (=> b!263948 m!394325))

(assert (=> b!263943 m!394319))

(declare-fun m!394327 () Bool)

(assert (=> b!263943 m!394327))

(declare-fun m!394329 () Bool)

(assert (=> b!263943 m!394329))

(declare-fun m!394331 () Bool)

(assert (=> b!263940 m!394331))

(declare-fun m!394333 () Bool)

(assert (=> b!263945 m!394333))

(declare-fun m!394335 () Bool)

(assert (=> start!57570 m!394335))

(declare-fun m!394337 () Bool)

(assert (=> start!57570 m!394337))

(declare-fun m!394339 () Bool)

(assert (=> start!57570 m!394339))

(push 1)

