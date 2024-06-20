; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57410 () Bool)

(assert start!57410)

(declare-fun res!220156 () Bool)

(declare-fun e!183379 () Bool)

(assert (=> start!57410 (=> (not res!220156) (not e!183379))))

(declare-datatypes ((array!14686 0))(
  ( (array!14687 (arr!7397 (Array (_ BitVec 32) (_ BitVec 8))) (size!6410 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11634 0))(
  ( (BitStream!11635 (buf!6878 array!14686) (currentByte!12730 (_ BitVec 32)) (currentBit!12725 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11634)

(declare-fun w2!580 () BitStream!11634)

(declare-fun isPrefixOf!0 (BitStream!11634 BitStream!11634) Bool)

(assert (=> start!57410 (= res!220156 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57410 e!183379))

(declare-fun e!183378 () Bool)

(declare-fun inv!12 (BitStream!11634) Bool)

(assert (=> start!57410 (and (inv!12 w1!584) e!183378)))

(declare-fun e!183376 () Bool)

(assert (=> start!57410 (and (inv!12 w2!580) e!183376)))

(declare-fun b!263133 () Bool)

(declare-fun res!220157 () Bool)

(declare-fun e!183380 () Bool)

(assert (=> b!263133 (=> res!220157 e!183380)))

(assert (=> b!263133 (= res!220157 (= (size!6410 (buf!6878 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263134 () Bool)

(declare-fun e!183381 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14686 array!14686 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263134 (= e!183381 (not (arrayBitRangesEq!0 (buf!6878 w1!584) (buf!6878 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6410 (buf!6878 w1!584)) (currentByte!12730 w1!584) (currentBit!12725 w1!584)))))))

(declare-fun b!263135 () Bool)

(declare-fun array_inv!6134 (array!14686) Bool)

(assert (=> b!263135 (= e!183378 (array_inv!6134 (buf!6878 w1!584)))))

(declare-fun b!263136 () Bool)

(assert (=> b!263136 (= e!183380 true)))

(declare-fun lt!404660 () (_ BitVec 64))

(assert (=> b!263136 (= lt!404660 (bitIndex!0 (size!6410 (buf!6878 w1!584)) (currentByte!12730 w1!584) (currentBit!12725 w1!584)))))

(declare-fun b!263137 () Bool)

(assert (=> b!263137 (= e!183376 (array_inv!6134 (buf!6878 w2!580)))))

(declare-fun b!263138 () Bool)

(assert (=> b!263138 (= e!183379 (not e!183380))))

(declare-fun res!220158 () Bool)

(assert (=> b!263138 (=> res!220158 e!183380)))

(assert (=> b!263138 (= res!220158 e!183381)))

(declare-fun res!220159 () Bool)

(assert (=> b!263138 (=> (not res!220159) (not e!183381))))

(assert (=> b!263138 (= res!220159 (not (= (size!6410 (buf!6878 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263138 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18763 0))(
  ( (Unit!18764) )
))
(declare-fun lt!404663 () Unit!18763)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11634) Unit!18763)

(assert (=> b!263138 (= lt!404663 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404661 () BitStream!11634)

(assert (=> b!263138 (isPrefixOf!0 lt!404661 lt!404661)))

(declare-fun lt!404662 () Unit!18763)

(assert (=> b!263138 (= lt!404662 (lemmaIsPrefixRefl!0 lt!404661))))

(assert (=> b!263138 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404659 () Unit!18763)

(assert (=> b!263138 (= lt!404659 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263138 (= lt!404661 (BitStream!11635 (buf!6878 w2!580) (currentByte!12730 w1!584) (currentBit!12725 w1!584)))))

(assert (= (and start!57410 res!220156) b!263138))

(assert (= (and b!263138 res!220159) b!263134))

(assert (= (and b!263138 (not res!220158)) b!263133))

(assert (= (and b!263133 (not res!220157)) b!263136))

(assert (= start!57410 b!263135))

(assert (= start!57410 b!263137))

(declare-fun m!393379 () Bool)

(assert (=> b!263136 m!393379))

(declare-fun m!393381 () Bool)

(assert (=> start!57410 m!393381))

(declare-fun m!393383 () Bool)

(assert (=> start!57410 m!393383))

(declare-fun m!393385 () Bool)

(assert (=> start!57410 m!393385))

(assert (=> b!263134 m!393379))

(assert (=> b!263134 m!393379))

(declare-fun m!393387 () Bool)

(assert (=> b!263134 m!393387))

(declare-fun m!393389 () Bool)

(assert (=> b!263138 m!393389))

(declare-fun m!393391 () Bool)

(assert (=> b!263138 m!393391))

(declare-fun m!393393 () Bool)

(assert (=> b!263138 m!393393))

(declare-fun m!393395 () Bool)

(assert (=> b!263138 m!393395))

(declare-fun m!393397 () Bool)

(assert (=> b!263138 m!393397))

(declare-fun m!393399 () Bool)

(assert (=> b!263138 m!393399))

(declare-fun m!393401 () Bool)

(assert (=> b!263135 m!393401))

(declare-fun m!393403 () Bool)

(assert (=> b!263137 m!393403))

(check-sat (not start!57410) (not b!263138) (not b!263134) (not b!263136) (not b!263135) (not b!263137))
(check-sat)
