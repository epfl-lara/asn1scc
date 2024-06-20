; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27806 () Bool)

(assert start!27806)

(declare-fun b!143542 () Bool)

(declare-fun res!119903 () Bool)

(declare-fun e!95622 () Bool)

(assert (=> b!143542 (=> (not res!119903) (not e!95622))))

(declare-datatypes ((array!6563 0))(
  ( (array!6564 (arr!3694 (Array (_ BitVec 32) (_ BitVec 8))) (size!2971 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5200 0))(
  ( (BitStream!5201 (buf!3400 array!6563) (currentByte!6284 (_ BitVec 32)) (currentBit!6279 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8942 0))(
  ( (Unit!8943) )
))
(declare-datatypes ((tuple2!12800 0))(
  ( (tuple2!12801 (_1!6741 Unit!8942) (_2!6741 BitStream!5200)) )
))
(declare-fun lt!222443 () tuple2!12800)

(declare-fun thiss!1634 () BitStream!5200)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143542 (= res!119903 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!12802 0))(
  ( (tuple2!12803 (_1!6742 BitStream!5200) (_2!6742 BitStream!5200)) )
))
(declare-fun lt!222446 () tuple2!12802)

(declare-fun b!143543 () Bool)

(declare-fun arr!237 () array!6563)

(declare-fun e!95629 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12804 0))(
  ( (tuple2!12805 (_1!6743 BitStream!5200) (_2!6743 array!6563)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!5200 array!6563 (_ BitVec 32) (_ BitVec 32)) tuple2!12804)

(assert (=> b!143543 (= e!95629 (not (= (_1!6743 (readByteArrayLoopPure!0 (_1!6742 lt!222446) arr!237 from!447 to!404)) (_2!6742 lt!222446))))))

(declare-fun lt!222445 () tuple2!12800)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143543 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!222442 () Unit!8942)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5200 array!6563 (_ BitVec 32)) Unit!8942)

(assert (=> b!143543 (= lt!222442 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3400 (_2!6741 lt!222445)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12806 0))(
  ( (tuple2!12807 (_1!6744 BitStream!5200) (_2!6744 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5200) tuple2!12806)

(assert (=> b!143543 (= (_2!6744 (readBytePure!0 (_1!6742 lt!222446))) (select (arr!3694 arr!237) from!447))))

(declare-fun lt!222440 () tuple2!12802)

(declare-fun reader!0 (BitStream!5200 BitStream!5200) tuple2!12802)

(assert (=> b!143543 (= lt!222440 (reader!0 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(assert (=> b!143543 (= lt!222446 (reader!0 thiss!1634 (_2!6741 lt!222445)))))

(declare-fun e!95626 () Bool)

(assert (=> b!143543 e!95626))

(declare-fun res!119905 () Bool)

(assert (=> b!143543 (=> (not res!119905) (not e!95626))))

(declare-fun lt!222444 () tuple2!12806)

(declare-fun lt!222449 () tuple2!12806)

(assert (=> b!143543 (= res!119905 (= (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222444))) (currentByte!6284 (_1!6744 lt!222444)) (currentBit!6279 (_1!6744 lt!222444))) (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222449))) (currentByte!6284 (_1!6744 lt!222449)) (currentBit!6279 (_1!6744 lt!222449)))))))

(declare-fun lt!222450 () Unit!8942)

(declare-fun lt!222441 () BitStream!5200)

(declare-fun readBytePrefixLemma!0 (BitStream!5200 BitStream!5200) Unit!8942)

(assert (=> b!143543 (= lt!222450 (readBytePrefixLemma!0 lt!222441 (_2!6741 lt!222445)))))

(assert (=> b!143543 (= lt!222449 (readBytePure!0 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))))))

(assert (=> b!143543 (= lt!222444 (readBytePure!0 lt!222441))))

(assert (=> b!143543 (= lt!222441 (BitStream!5201 (buf!3400 (_2!6741 lt!222443)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(declare-fun e!95624 () Bool)

(assert (=> b!143543 e!95624))

(declare-fun res!119899 () Bool)

(assert (=> b!143543 (=> (not res!119899) (not e!95624))))

(declare-fun isPrefixOf!0 (BitStream!5200 BitStream!5200) Bool)

(assert (=> b!143543 (= res!119899 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222445)))))

(declare-fun lt!222436 () Unit!8942)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5200 BitStream!5200 BitStream!5200) Unit!8942)

(assert (=> b!143543 (= lt!222436 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(declare-fun e!95631 () Bool)

(assert (=> b!143543 e!95631))

(declare-fun res!119902 () Bool)

(assert (=> b!143543 (=> (not res!119902) (not e!95631))))

(assert (=> b!143543 (= res!119902 (= (size!2971 (buf!3400 (_2!6741 lt!222443))) (size!2971 (buf!3400 (_2!6741 lt!222445)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5200 array!6563 (_ BitVec 32) (_ BitVec 32)) tuple2!12800)

(assert (=> b!143543 (= lt!222445 (appendByteArrayLoop!0 (_2!6741 lt!222443) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143543 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222451 () Unit!8942)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5200 BitStream!5200 (_ BitVec 64) (_ BitVec 32)) Unit!8942)

(assert (=> b!143543 (= lt!222451 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6741 lt!222443) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143543 e!95622))

(declare-fun res!119897 () Bool)

(assert (=> b!143543 (=> (not res!119897) (not e!95622))))

(assert (=> b!143543 (= res!119897 (= (size!2971 (buf!3400 thiss!1634)) (size!2971 (buf!3400 (_2!6741 lt!222443)))))))

(declare-fun appendByte!0 (BitStream!5200 (_ BitVec 8)) tuple2!12800)

(assert (=> b!143543 (= lt!222443 (appendByte!0 thiss!1634 (select (arr!3694 arr!237) from!447)))))

(declare-fun res!119894 () Bool)

(assert (=> start!27806 (=> (not res!119894) (not e!95629))))

(assert (=> start!27806 (= res!119894 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2971 arr!237))))))

(assert (=> start!27806 e!95629))

(assert (=> start!27806 true))

(declare-fun array_inv!2760 (array!6563) Bool)

(assert (=> start!27806 (array_inv!2760 arr!237)))

(declare-fun e!95623 () Bool)

(declare-fun inv!12 (BitStream!5200) Bool)

(assert (=> start!27806 (and (inv!12 thiss!1634) e!95623)))

(declare-fun b!143544 () Bool)

(assert (=> b!143544 (= e!95623 (array_inv!2760 (buf!3400 thiss!1634)))))

(declare-fun lt!222447 () tuple2!12802)

(declare-fun lt!222439 () tuple2!12806)

(declare-fun b!143545 () Bool)

(assert (=> b!143545 (= e!95622 (and (= (_2!6744 lt!222439) (select (arr!3694 arr!237) from!447)) (= (_1!6744 lt!222439) (_2!6742 lt!222447))))))

(assert (=> b!143545 (= lt!222439 (readBytePure!0 (_1!6742 lt!222447)))))

(assert (=> b!143545 (= lt!222447 (reader!0 thiss!1634 (_2!6741 lt!222443)))))

(declare-fun b!143546 () Bool)

(declare-fun res!119906 () Bool)

(assert (=> b!143546 (=> (not res!119906) (not e!95629))))

(assert (=> b!143546 (= res!119906 (bvslt from!447 to!404))))

(declare-fun lt!222438 () tuple2!12804)

(declare-fun b!143547 () Bool)

(declare-fun e!95628 () Bool)

(declare-fun arrayRangesEq!287 (array!6563 array!6563 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143547 (= e!95628 (not (arrayRangesEq!287 arr!237 (_2!6743 lt!222438) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143548 () Bool)

(declare-fun res!119904 () Bool)

(assert (=> b!143548 (=> (not res!119904) (not e!95629))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143548 (= res!119904 (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634))))))

(declare-fun b!143549 () Bool)

(assert (=> b!143549 (= e!95626 (= (_2!6744 lt!222444) (_2!6744 lt!222449)))))

(declare-fun b!143550 () Bool)

(declare-fun res!119898 () Bool)

(assert (=> b!143550 (=> (not res!119898) (not e!95629))))

(assert (=> b!143550 (= res!119898 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143551 () Bool)

(declare-fun e!95627 () Bool)

(assert (=> b!143551 (= e!95627 (not e!95628))))

(declare-fun res!119895 () Bool)

(assert (=> b!143551 (=> res!119895 e!95628)))

(declare-fun lt!222435 () tuple2!12802)

(assert (=> b!143551 (= res!119895 (or (not (= (size!2971 (_2!6743 lt!222438)) (size!2971 arr!237))) (not (= (_1!6743 lt!222438) (_2!6742 lt!222435)))))))

(assert (=> b!143551 (= lt!222438 (readByteArrayLoopPure!0 (_1!6742 lt!222435) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!222437 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143551 (validate_offset_bits!1 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) lt!222437)))

(declare-fun lt!222448 () Unit!8942)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5200 array!6563 (_ BitVec 64)) Unit!8942)

(assert (=> b!143551 (= lt!222448 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6741 lt!222443) (buf!3400 (_2!6741 lt!222445)) lt!222437))))

(assert (=> b!143551 (= lt!222435 (reader!0 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(declare-fun b!143552 () Bool)

(declare-fun res!119900 () Bool)

(assert (=> b!143552 (=> (not res!119900) (not e!95622))))

(assert (=> b!143552 (= res!119900 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222443)))))

(declare-fun b!143553 () Bool)

(assert (=> b!143553 (= e!95624 (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 (_2!6741 lt!222443)))))))

(declare-fun b!143554 () Bool)

(declare-fun res!119896 () Bool)

(assert (=> b!143554 (=> (not res!119896) (not e!95627))))

(assert (=> b!143554 (= res!119896 (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(declare-fun b!143555 () Bool)

(assert (=> b!143555 (= e!95631 e!95627)))

(declare-fun res!119901 () Bool)

(assert (=> b!143555 (=> (not res!119901) (not e!95627))))

(assert (=> b!143555 (= res!119901 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445))) (bvadd (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222437))))))

(assert (=> b!143555 (= lt!222437 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27806 res!119894) b!143550))

(assert (= (and b!143550 res!119898) b!143546))

(assert (= (and b!143546 res!119906) b!143548))

(assert (= (and b!143548 res!119904) b!143543))

(assert (= (and b!143543 res!119897) b!143542))

(assert (= (and b!143542 res!119903) b!143552))

(assert (= (and b!143552 res!119900) b!143545))

(assert (= (and b!143543 res!119902) b!143555))

(assert (= (and b!143555 res!119901) b!143554))

(assert (= (and b!143554 res!119896) b!143551))

(assert (= (and b!143551 (not res!119895)) b!143547))

(assert (= (and b!143543 res!119899) b!143553))

(assert (= (and b!143543 res!119905) b!143549))

(assert (= start!27806 b!143544))

(declare-fun m!220381 () Bool)

(assert (=> b!143550 m!220381))

(declare-fun m!220383 () Bool)

(assert (=> b!143555 m!220383))

(declare-fun m!220385 () Bool)

(assert (=> b!143555 m!220385))

(declare-fun m!220387 () Bool)

(assert (=> b!143543 m!220387))

(declare-fun m!220389 () Bool)

(assert (=> b!143543 m!220389))

(declare-fun m!220391 () Bool)

(assert (=> b!143543 m!220391))

(declare-fun m!220393 () Bool)

(assert (=> b!143543 m!220393))

(declare-fun m!220395 () Bool)

(assert (=> b!143543 m!220395))

(declare-fun m!220397 () Bool)

(assert (=> b!143543 m!220397))

(declare-fun m!220399 () Bool)

(assert (=> b!143543 m!220399))

(declare-fun m!220401 () Bool)

(assert (=> b!143543 m!220401))

(declare-fun m!220403 () Bool)

(assert (=> b!143543 m!220403))

(declare-fun m!220405 () Bool)

(assert (=> b!143543 m!220405))

(declare-fun m!220407 () Bool)

(assert (=> b!143543 m!220407))

(declare-fun m!220409 () Bool)

(assert (=> b!143543 m!220409))

(declare-fun m!220411 () Bool)

(assert (=> b!143543 m!220411))

(declare-fun m!220413 () Bool)

(assert (=> b!143543 m!220413))

(declare-fun m!220415 () Bool)

(assert (=> b!143543 m!220415))

(declare-fun m!220417 () Bool)

(assert (=> b!143543 m!220417))

(declare-fun m!220419 () Bool)

(assert (=> b!143543 m!220419))

(declare-fun m!220421 () Bool)

(assert (=> b!143543 m!220421))

(assert (=> b!143543 m!220415))

(declare-fun m!220423 () Bool)

(assert (=> b!143553 m!220423))

(declare-fun m!220425 () Bool)

(assert (=> b!143548 m!220425))

(assert (=> b!143542 m!220385))

(declare-fun m!220427 () Bool)

(assert (=> b!143542 m!220427))

(declare-fun m!220429 () Bool)

(assert (=> b!143552 m!220429))

(declare-fun m!220431 () Bool)

(assert (=> b!143551 m!220431))

(declare-fun m!220433 () Bool)

(assert (=> b!143551 m!220433))

(declare-fun m!220435 () Bool)

(assert (=> b!143551 m!220435))

(assert (=> b!143551 m!220407))

(assert (=> b!143545 m!220415))

(declare-fun m!220437 () Bool)

(assert (=> b!143545 m!220437))

(declare-fun m!220439 () Bool)

(assert (=> b!143545 m!220439))

(declare-fun m!220441 () Bool)

(assert (=> b!143547 m!220441))

(declare-fun m!220443 () Bool)

(assert (=> b!143544 m!220443))

(declare-fun m!220445 () Bool)

(assert (=> b!143554 m!220445))

(declare-fun m!220447 () Bool)

(assert (=> start!27806 m!220447))

(declare-fun m!220449 () Bool)

(assert (=> start!27806 m!220449))

(push 1)

(assert (not b!143548))

(assert (not b!143544))

(assert (not b!143550))

(assert (not b!143555))

(assert (not b!143542))

(assert (not b!143554))

(assert (not b!143552))

(assert (not start!27806))

(assert (not b!143547))

(assert (not b!143553))

(assert (not b!143545))

(assert (not b!143551))

(assert (not b!143543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45860 () Bool)

(declare-fun e!95712 () Bool)

(assert (=> d!45860 e!95712))

(declare-fun res!120015 () Bool)

(assert (=> d!45860 (=> (not res!120015) (not e!95712))))

(declare-fun lt!222680 () (_ BitVec 64))

(declare-fun lt!222683 () (_ BitVec 64))

(declare-fun lt!222679 () (_ BitVec 64))

(assert (=> d!45860 (= res!120015 (= lt!222679 (bvsub lt!222680 lt!222683)))))

(assert (=> d!45860 (or (= (bvand lt!222680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222680 lt!222683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45860 (= lt!222683 (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443)))))))

(declare-fun lt!222682 () (_ BitVec 64))

(declare-fun lt!222681 () (_ BitVec 64))

(assert (=> d!45860 (= lt!222680 (bvmul lt!222682 lt!222681))))

(assert (=> d!45860 (or (= lt!222682 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222681 (bvsdiv (bvmul lt!222682 lt!222681) lt!222682)))))

(assert (=> d!45860 (= lt!222681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45860 (= lt!222682 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))))))

(assert (=> d!45860 (= lt!222679 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443)))))))

(assert (=> d!45860 (invariant!0 (currentBit!6279 (_2!6741 lt!222443)) (currentByte!6284 (_2!6741 lt!222443)) (size!2971 (buf!3400 (_2!6741 lt!222443))))))

(assert (=> d!45860 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))) lt!222679)))

(declare-fun b!143678 () Bool)

(declare-fun res!120016 () Bool)

(assert (=> b!143678 (=> (not res!120016) (not e!95712))))

(assert (=> b!143678 (= res!120016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222679))))

(declare-fun b!143679 () Bool)

(declare-fun lt!222684 () (_ BitVec 64))

(assert (=> b!143679 (= e!95712 (bvsle lt!222679 (bvmul lt!222684 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143679 (or (= lt!222684 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222684 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222684)))))

(assert (=> b!143679 (= lt!222684 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))))))

(assert (= (and d!45860 res!120015) b!143678))

(assert (= (and b!143678 res!120016) b!143679))

(declare-fun m!220641 () Bool)

(assert (=> d!45860 m!220641))

(declare-fun m!220643 () Bool)

(assert (=> d!45860 m!220643))

(assert (=> b!143542 d!45860))

(declare-fun d!45872 () Bool)

(declare-fun e!95713 () Bool)

(assert (=> d!45872 e!95713))

(declare-fun res!120017 () Bool)

(assert (=> d!45872 (=> (not res!120017) (not e!95713))))

(declare-fun lt!222689 () (_ BitVec 64))

(declare-fun lt!222685 () (_ BitVec 64))

(declare-fun lt!222686 () (_ BitVec 64))

(assert (=> d!45872 (= res!120017 (= lt!222685 (bvsub lt!222686 lt!222689)))))

(assert (=> d!45872 (or (= (bvand lt!222686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222686 lt!222689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45872 (= lt!222689 (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634))))))

(declare-fun lt!222688 () (_ BitVec 64))

(declare-fun lt!222687 () (_ BitVec 64))

(assert (=> d!45872 (= lt!222686 (bvmul lt!222688 lt!222687))))

(assert (=> d!45872 (or (= lt!222688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222687 (bvsdiv (bvmul lt!222688 lt!222687) lt!222688)))))

(assert (=> d!45872 (= lt!222687 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45872 (= lt!222688 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))))))

(assert (=> d!45872 (= lt!222685 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6284 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6279 thiss!1634))))))

(assert (=> d!45872 (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634)))))

(assert (=> d!45872 (= (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)) lt!222685)))

(declare-fun b!143680 () Bool)

(declare-fun res!120018 () Bool)

(assert (=> b!143680 (=> (not res!120018) (not e!95713))))

(assert (=> b!143680 (= res!120018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222685))))

(declare-fun b!143681 () Bool)

(declare-fun lt!222690 () (_ BitVec 64))

(assert (=> b!143681 (= e!95713 (bvsle lt!222685 (bvmul lt!222690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143681 (or (= lt!222690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222690)))))

(assert (=> b!143681 (= lt!222690 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))))))

(assert (= (and d!45872 res!120017) b!143680))

(assert (= (and b!143680 res!120018) b!143681))

(declare-fun m!220649 () Bool)

(assert (=> d!45872 m!220649))

(assert (=> d!45872 m!220425))

(assert (=> b!143542 d!45872))

(declare-fun d!45874 () Bool)

(declare-fun res!120026 () Bool)

(declare-fun e!95718 () Bool)

(assert (=> d!45874 (=> (not res!120026) (not e!95718))))

(assert (=> d!45874 (= res!120026 (= (size!2971 (buf!3400 thiss!1634)) (size!2971 (buf!3400 (_2!6741 lt!222443)))))))

(assert (=> d!45874 (= (isPrefixOf!0 thiss!1634 (_2!6741 lt!222443)) e!95718)))

(declare-fun b!143688 () Bool)

(declare-fun res!120025 () Bool)

(assert (=> b!143688 (=> (not res!120025) (not e!95718))))

(assert (=> b!143688 (= res!120025 (bvsle (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)) (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443)))))))

(declare-fun b!143689 () Bool)

(declare-fun e!95719 () Bool)

(assert (=> b!143689 (= e!95718 e!95719)))

(declare-fun res!120027 () Bool)

(assert (=> b!143689 (=> res!120027 e!95719)))

(assert (=> b!143689 (= res!120027 (= (size!2971 (buf!3400 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143690 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6563 array!6563 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143690 (= e!95719 (arrayBitRangesEq!0 (buf!3400 thiss!1634) (buf!3400 (_2!6741 lt!222443)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))))))

(assert (= (and d!45874 res!120026) b!143688))

(assert (= (and b!143688 res!120025) b!143689))

(assert (= (and b!143689 (not res!120027)) b!143690))

(assert (=> b!143688 m!220427))

(assert (=> b!143688 m!220385))

(assert (=> b!143690 m!220427))

(assert (=> b!143690 m!220427))

(declare-fun m!220673 () Bool)

(assert (=> b!143690 m!220673))

(assert (=> b!143552 d!45874))

(declare-fun d!45886 () Bool)

(assert (=> d!45886 (= (array_inv!2760 arr!237) (bvsge (size!2971 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27806 d!45886))

(declare-fun d!45888 () Bool)

(assert (=> d!45888 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634))))))

(declare-fun bs!11265 () Bool)

(assert (= bs!11265 d!45888))

(assert (=> bs!11265 m!220425))

(assert (=> start!27806 d!45888))

(declare-fun d!45890 () Bool)

(declare-fun e!95726 () Bool)

(assert (=> d!45890 e!95726))

(declare-fun res!120037 () Bool)

(assert (=> d!45890 (=> (not res!120037) (not e!95726))))

(declare-fun lt!222691 () (_ BitVec 64))

(declare-fun lt!222692 () (_ BitVec 64))

(declare-fun lt!222695 () (_ BitVec 64))

(assert (=> d!45890 (= res!120037 (= lt!222691 (bvsub lt!222692 lt!222695)))))

(assert (=> d!45890 (or (= (bvand lt!222692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222695 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222692 lt!222695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45890 (= lt!222695 (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222444)))) ((_ sign_extend 32) (currentByte!6284 (_1!6744 lt!222444))) ((_ sign_extend 32) (currentBit!6279 (_1!6744 lt!222444)))))))

(declare-fun lt!222694 () (_ BitVec 64))

(declare-fun lt!222693 () (_ BitVec 64))

(assert (=> d!45890 (= lt!222692 (bvmul lt!222694 lt!222693))))

(assert (=> d!45890 (or (= lt!222694 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222693 (bvsdiv (bvmul lt!222694 lt!222693) lt!222694)))))

(assert (=> d!45890 (= lt!222693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45890 (= lt!222694 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222444)))))))

(assert (=> d!45890 (= lt!222691 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6284 (_1!6744 lt!222444))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6279 (_1!6744 lt!222444)))))))

(assert (=> d!45890 (invariant!0 (currentBit!6279 (_1!6744 lt!222444)) (currentByte!6284 (_1!6744 lt!222444)) (size!2971 (buf!3400 (_1!6744 lt!222444))))))

(assert (=> d!45890 (= (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222444))) (currentByte!6284 (_1!6744 lt!222444)) (currentBit!6279 (_1!6744 lt!222444))) lt!222691)))

(declare-fun b!143700 () Bool)

(declare-fun res!120038 () Bool)

(assert (=> b!143700 (=> (not res!120038) (not e!95726))))

(assert (=> b!143700 (= res!120038 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222691))))

(declare-fun b!143701 () Bool)

(declare-fun lt!222696 () (_ BitVec 64))

(assert (=> b!143701 (= e!95726 (bvsle lt!222691 (bvmul lt!222696 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143701 (or (= lt!222696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222696)))))

(assert (=> b!143701 (= lt!222696 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222444)))))))

(assert (= (and d!45890 res!120037) b!143700))

(assert (= (and b!143700 res!120038) b!143701))

(declare-fun m!220675 () Bool)

(assert (=> d!45890 m!220675))

(declare-fun m!220677 () Bool)

(assert (=> d!45890 m!220677))

(assert (=> b!143543 d!45890))

(declare-fun d!45892 () Bool)

(assert (=> d!45892 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11267 () Bool)

(assert (= bs!11267 d!45892))

(declare-fun m!220685 () Bool)

(assert (=> bs!11267 m!220685))

(assert (=> b!143543 d!45892))

(declare-fun d!45900 () Bool)

(declare-fun e!95729 () Bool)

(assert (=> d!45900 e!95729))

(declare-fun res!120042 () Bool)

(assert (=> d!45900 (=> (not res!120042) (not e!95729))))

(declare-fun lt!222702 () (_ BitVec 64))

(declare-fun lt!222698 () (_ BitVec 64))

(declare-fun lt!222699 () (_ BitVec 64))

(assert (=> d!45900 (= res!120042 (= lt!222698 (bvsub lt!222699 lt!222702)))))

(assert (=> d!45900 (or (= (bvand lt!222699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222702 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222699 lt!222702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45900 (= lt!222702 (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222449)))) ((_ sign_extend 32) (currentByte!6284 (_1!6744 lt!222449))) ((_ sign_extend 32) (currentBit!6279 (_1!6744 lt!222449)))))))

(declare-fun lt!222701 () (_ BitVec 64))

(declare-fun lt!222700 () (_ BitVec 64))

(assert (=> d!45900 (= lt!222699 (bvmul lt!222701 lt!222700))))

(assert (=> d!45900 (or (= lt!222701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222700 (bvsdiv (bvmul lt!222701 lt!222700) lt!222701)))))

(assert (=> d!45900 (= lt!222700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45900 (= lt!222701 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222449)))))))

(assert (=> d!45900 (= lt!222698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6284 (_1!6744 lt!222449))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6279 (_1!6744 lt!222449)))))))

(assert (=> d!45900 (invariant!0 (currentBit!6279 (_1!6744 lt!222449)) (currentByte!6284 (_1!6744 lt!222449)) (size!2971 (buf!3400 (_1!6744 lt!222449))))))

(assert (=> d!45900 (= (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222449))) (currentByte!6284 (_1!6744 lt!222449)) (currentBit!6279 (_1!6744 lt!222449))) lt!222698)))

(declare-fun b!143705 () Bool)

(declare-fun res!120043 () Bool)

(assert (=> b!143705 (=> (not res!120043) (not e!95729))))

(assert (=> b!143705 (= res!120043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222698))))

(declare-fun b!143706 () Bool)

(declare-fun lt!222703 () (_ BitVec 64))

(assert (=> b!143706 (= e!95729 (bvsle lt!222698 (bvmul lt!222703 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143706 (or (= lt!222703 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222703 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222703)))))

(assert (=> b!143706 (= lt!222703 ((_ sign_extend 32) (size!2971 (buf!3400 (_1!6744 lt!222449)))))))

(assert (= (and d!45900 res!120042) b!143705))

(assert (= (and b!143705 res!120043) b!143706))

(declare-fun m!220687 () Bool)

(assert (=> d!45900 m!220687))

(declare-fun m!220689 () Bool)

(assert (=> d!45900 m!220689))

(assert (=> b!143543 d!45900))

(declare-fun d!45902 () Bool)

(declare-fun res!120045 () Bool)

(declare-fun e!95730 () Bool)

(assert (=> d!45902 (=> (not res!120045) (not e!95730))))

(assert (=> d!45902 (= res!120045 (= (size!2971 (buf!3400 thiss!1634)) (size!2971 (buf!3400 (_2!6741 lt!222445)))))))

(assert (=> d!45902 (= (isPrefixOf!0 thiss!1634 (_2!6741 lt!222445)) e!95730)))

(declare-fun b!143707 () Bool)

(declare-fun res!120044 () Bool)

(assert (=> b!143707 (=> (not res!120044) (not e!95730))))

(assert (=> b!143707 (= res!120044 (bvsle (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)) (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445)))))))

(declare-fun b!143708 () Bool)

(declare-fun e!95731 () Bool)

(assert (=> b!143708 (= e!95730 e!95731)))

(declare-fun res!120046 () Bool)

(assert (=> b!143708 (=> res!120046 e!95731)))

(assert (=> b!143708 (= res!120046 (= (size!2971 (buf!3400 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143709 () Bool)

(assert (=> b!143709 (= e!95731 (arrayBitRangesEq!0 (buf!3400 thiss!1634) (buf!3400 (_2!6741 lt!222445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))))))

(assert (= (and d!45902 res!120045) b!143707))

(assert (= (and b!143707 res!120044) b!143708))

(assert (= (and b!143708 (not res!120046)) b!143709))

(assert (=> b!143707 m!220427))

(assert (=> b!143707 m!220383))

(assert (=> b!143709 m!220427))

(assert (=> b!143709 m!220427))

(declare-fun m!220691 () Bool)

(assert (=> b!143709 m!220691))

(assert (=> b!143543 d!45902))

(declare-fun d!45904 () Bool)

(declare-datatypes ((tuple2!12828 0))(
  ( (tuple2!12829 (_1!6756 (_ BitVec 8)) (_2!6756 BitStream!5200)) )
))
(declare-fun lt!222706 () tuple2!12828)

(declare-fun readByte!0 (BitStream!5200) tuple2!12828)

(assert (=> d!45904 (= lt!222706 (readByte!0 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))))))

(assert (=> d!45904 (= (readBytePure!0 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))) (tuple2!12807 (_2!6756 lt!222706) (_1!6756 lt!222706)))))

(declare-fun bs!11268 () Bool)

(assert (= bs!11268 d!45904))

(declare-fun m!220693 () Bool)

(assert (=> bs!11268 m!220693))

(assert (=> b!143543 d!45904))

(declare-fun lt!222759 () (_ BitVec 64))

(declare-fun e!95737 () Bool)

(declare-fun lt!222760 () (_ BitVec 64))

(declare-fun b!143720 () Bool)

(declare-fun lt!222755 () tuple2!12802)

(declare-fun withMovedBitIndex!0 (BitStream!5200 (_ BitVec 64)) BitStream!5200)

(assert (=> b!143720 (= e!95737 (= (_1!6742 lt!222755) (withMovedBitIndex!0 (_2!6742 lt!222755) (bvsub lt!222759 lt!222760))))))

(assert (=> b!143720 (or (= (bvand lt!222759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222759 lt!222760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143720 (= lt!222760 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445))))))

(assert (=> b!143720 (= lt!222759 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))))))

(declare-fun b!143721 () Bool)

(declare-fun res!120053 () Bool)

(assert (=> b!143721 (=> (not res!120053) (not e!95737))))

(assert (=> b!143721 (= res!120053 (isPrefixOf!0 (_1!6742 lt!222755) (_2!6741 lt!222443)))))

(declare-fun d!45906 () Bool)

(assert (=> d!45906 e!95737))

(declare-fun res!120054 () Bool)

(assert (=> d!45906 (=> (not res!120054) (not e!95737))))

(assert (=> d!45906 (= res!120054 (isPrefixOf!0 (_1!6742 lt!222755) (_2!6742 lt!222755)))))

(declare-fun lt!222763 () BitStream!5200)

(assert (=> d!45906 (= lt!222755 (tuple2!12803 lt!222763 (_2!6741 lt!222445)))))

(declare-fun lt!222753 () Unit!8942)

(declare-fun lt!222756 () Unit!8942)

(assert (=> d!45906 (= lt!222753 lt!222756)))

(assert (=> d!45906 (isPrefixOf!0 lt!222763 (_2!6741 lt!222445))))

(assert (=> d!45906 (= lt!222756 (lemmaIsPrefixTransitive!0 lt!222763 (_2!6741 lt!222445) (_2!6741 lt!222445)))))

(declare-fun lt!222762 () Unit!8942)

(declare-fun lt!222751 () Unit!8942)

(assert (=> d!45906 (= lt!222762 lt!222751)))

(assert (=> d!45906 (isPrefixOf!0 lt!222763 (_2!6741 lt!222445))))

(assert (=> d!45906 (= lt!222751 (lemmaIsPrefixTransitive!0 lt!222763 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(declare-fun lt!222764 () Unit!8942)

(declare-fun e!95736 () Unit!8942)

(assert (=> d!45906 (= lt!222764 e!95736)))

(declare-fun c!7849 () Bool)

(assert (=> d!45906 (= c!7849 (not (= (size!2971 (buf!3400 (_2!6741 lt!222443))) #b00000000000000000000000000000000)))))

(declare-fun lt!222761 () Unit!8942)

(declare-fun lt!222748 () Unit!8942)

(assert (=> d!45906 (= lt!222761 lt!222748)))

(assert (=> d!45906 (isPrefixOf!0 (_2!6741 lt!222445) (_2!6741 lt!222445))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5200) Unit!8942)

(assert (=> d!45906 (= lt!222748 (lemmaIsPrefixRefl!0 (_2!6741 lt!222445)))))

(declare-fun lt!222747 () Unit!8942)

(declare-fun lt!222752 () Unit!8942)

(assert (=> d!45906 (= lt!222747 lt!222752)))

(assert (=> d!45906 (= lt!222752 (lemmaIsPrefixRefl!0 (_2!6741 lt!222445)))))

(declare-fun lt!222757 () Unit!8942)

(declare-fun lt!222758 () Unit!8942)

(assert (=> d!45906 (= lt!222757 lt!222758)))

(assert (=> d!45906 (isPrefixOf!0 lt!222763 lt!222763)))

(assert (=> d!45906 (= lt!222758 (lemmaIsPrefixRefl!0 lt!222763))))

(declare-fun lt!222766 () Unit!8942)

(declare-fun lt!222749 () Unit!8942)

(assert (=> d!45906 (= lt!222766 lt!222749)))

(assert (=> d!45906 (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!222443))))

(assert (=> d!45906 (= lt!222749 (lemmaIsPrefixRefl!0 (_2!6741 lt!222443)))))

(assert (=> d!45906 (= lt!222763 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))))))

(assert (=> d!45906 (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!222445))))

(assert (=> d!45906 (= (reader!0 (_2!6741 lt!222443) (_2!6741 lt!222445)) lt!222755)))

(declare-fun b!143722 () Bool)

(declare-fun res!120055 () Bool)

(assert (=> b!143722 (=> (not res!120055) (not e!95737))))

(assert (=> b!143722 (= res!120055 (isPrefixOf!0 (_2!6742 lt!222755) (_2!6741 lt!222445)))))

(declare-fun b!143723 () Bool)

(declare-fun lt!222754 () Unit!8942)

(assert (=> b!143723 (= e!95736 lt!222754)))

(declare-fun lt!222750 () (_ BitVec 64))

(assert (=> b!143723 (= lt!222750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222765 () (_ BitVec 64))

(assert (=> b!143723 (= lt!222765 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6563 array!6563 (_ BitVec 64) (_ BitVec 64)) Unit!8942)

(assert (=> b!143723 (= lt!222754 (arrayBitRangesEqSymmetric!0 (buf!3400 (_2!6741 lt!222443)) (buf!3400 (_2!6741 lt!222445)) lt!222750 lt!222765))))

(assert (=> b!143723 (arrayBitRangesEq!0 (buf!3400 (_2!6741 lt!222445)) (buf!3400 (_2!6741 lt!222443)) lt!222750 lt!222765)))

(declare-fun b!143724 () Bool)

(declare-fun Unit!8951 () Unit!8942)

(assert (=> b!143724 (= e!95736 Unit!8951)))

(assert (= (and d!45906 c!7849) b!143723))

(assert (= (and d!45906 (not c!7849)) b!143724))

(assert (= (and d!45906 res!120054) b!143721))

(assert (= (and b!143721 res!120053) b!143722))

(assert (= (and b!143722 res!120055) b!143720))

(declare-fun m!220695 () Bool)

(assert (=> d!45906 m!220695))

(assert (=> d!45906 m!220445))

(declare-fun m!220697 () Bool)

(assert (=> d!45906 m!220697))

(declare-fun m!220699 () Bool)

(assert (=> d!45906 m!220699))

(declare-fun m!220701 () Bool)

(assert (=> d!45906 m!220701))

(declare-fun m!220703 () Bool)

(assert (=> d!45906 m!220703))

(declare-fun m!220705 () Bool)

(assert (=> d!45906 m!220705))

(declare-fun m!220707 () Bool)

(assert (=> d!45906 m!220707))

(declare-fun m!220709 () Bool)

(assert (=> d!45906 m!220709))

(declare-fun m!220711 () Bool)

(assert (=> d!45906 m!220711))

(declare-fun m!220713 () Bool)

(assert (=> d!45906 m!220713))

(declare-fun m!220715 () Bool)

(assert (=> b!143722 m!220715))

(declare-fun m!220717 () Bool)

(assert (=> b!143721 m!220717))

(assert (=> b!143723 m!220385))

(declare-fun m!220719 () Bool)

(assert (=> b!143723 m!220719))

(declare-fun m!220721 () Bool)

(assert (=> b!143723 m!220721))

(declare-fun m!220723 () Bool)

(assert (=> b!143720 m!220723))

(assert (=> b!143720 m!220383))

(assert (=> b!143720 m!220385))

(assert (=> b!143543 d!45906))

(declare-fun d!45908 () Bool)

(assert (=> d!45908 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222445))))

(declare-fun lt!222769 () Unit!8942)

(declare-fun choose!30 (BitStream!5200 BitStream!5200 BitStream!5200) Unit!8942)

(assert (=> d!45908 (= lt!222769 (choose!30 thiss!1634 (_2!6741 lt!222443) (_2!6741 lt!222445)))))

(assert (=> d!45908 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222443))))

(assert (=> d!45908 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6741 lt!222443) (_2!6741 lt!222445)) lt!222769)))

(declare-fun bs!11269 () Bool)

(assert (= bs!11269 d!45908))

(assert (=> bs!11269 m!220413))

(declare-fun m!220725 () Bool)

(assert (=> bs!11269 m!220725))

(assert (=> bs!11269 m!220429))

(assert (=> b!143543 d!45908))

(declare-fun d!45912 () Bool)

(declare-fun e!95746 () Bool)

(assert (=> d!45912 e!95746))

(declare-fun res!120068 () Bool)

(assert (=> d!45912 (=> (not res!120068) (not e!95746))))

(declare-fun lt!222802 () tuple2!12806)

(declare-fun lt!222801 () tuple2!12806)

(assert (=> d!45912 (= res!120068 (= (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222802))) (currentByte!6284 (_1!6744 lt!222802)) (currentBit!6279 (_1!6744 lt!222802))) (bitIndex!0 (size!2971 (buf!3400 (_1!6744 lt!222801))) (currentByte!6284 (_1!6744 lt!222801)) (currentBit!6279 (_1!6744 lt!222801)))))))

(declare-fun lt!222800 () BitStream!5200)

(declare-fun lt!222799 () Unit!8942)

(declare-fun choose!14 (BitStream!5200 BitStream!5200 BitStream!5200 tuple2!12806 tuple2!12806 BitStream!5200 (_ BitVec 8) tuple2!12806 tuple2!12806 BitStream!5200 (_ BitVec 8)) Unit!8942)

(assert (=> d!45912 (= lt!222799 (choose!14 lt!222441 (_2!6741 lt!222445) lt!222800 lt!222802 (tuple2!12807 (_1!6744 lt!222802) (_2!6744 lt!222802)) (_1!6744 lt!222802) (_2!6744 lt!222802) lt!222801 (tuple2!12807 (_1!6744 lt!222801) (_2!6744 lt!222801)) (_1!6744 lt!222801) (_2!6744 lt!222801)))))

(assert (=> d!45912 (= lt!222801 (readBytePure!0 lt!222800))))

(assert (=> d!45912 (= lt!222802 (readBytePure!0 lt!222441))))

(assert (=> d!45912 (= lt!222800 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 lt!222441) (currentBit!6279 lt!222441)))))

(assert (=> d!45912 (= (readBytePrefixLemma!0 lt!222441 (_2!6741 lt!222445)) lt!222799)))

(declare-fun b!143737 () Bool)

(assert (=> b!143737 (= e!95746 (= (_2!6744 lt!222802) (_2!6744 lt!222801)))))

(assert (= (and d!45912 res!120068) b!143737))

(declare-fun m!220729 () Bool)

(assert (=> d!45912 m!220729))

(declare-fun m!220731 () Bool)

(assert (=> d!45912 m!220731))

(declare-fun m!220733 () Bool)

(assert (=> d!45912 m!220733))

(declare-fun m!220735 () Bool)

(assert (=> d!45912 m!220735))

(assert (=> d!45912 m!220393))

(assert (=> b!143543 d!45912))

(declare-fun d!45916 () Bool)

(declare-fun e!95798 () Bool)

(assert (=> d!45916 e!95798))

(declare-fun res!120153 () Bool)

(assert (=> d!45916 (=> (not res!120153) (not e!95798))))

(declare-fun lt!223031 () tuple2!12800)

(assert (=> d!45916 (= res!120153 (= (size!2971 (buf!3400 (_2!6741 lt!222443))) (size!2971 (buf!3400 (_2!6741 lt!223031)))))))

(declare-fun choose!64 (BitStream!5200 array!6563 (_ BitVec 32) (_ BitVec 32)) tuple2!12800)

(assert (=> d!45916 (= lt!223031 (choose!64 (_2!6741 lt!222443) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45916 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2971 arr!237)))))

(assert (=> d!45916 (= (appendByteArrayLoop!0 (_2!6741 lt!222443) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!223031)))

(declare-fun b!143828 () Bool)

(declare-fun e!95800 () Bool)

(assert (=> b!143828 (= e!95798 e!95800)))

(declare-fun res!120152 () Bool)

(assert (=> b!143828 (=> (not res!120152) (not e!95800))))

(declare-fun lt!223025 () tuple2!12802)

(declare-fun lt!223027 () tuple2!12804)

(assert (=> b!143828 (= res!120152 (and (= (size!2971 (_2!6743 lt!223027)) (size!2971 arr!237)) (= (_1!6743 lt!223027) (_2!6742 lt!223025))))))

(assert (=> b!143828 (= lt!223027 (readByteArrayLoopPure!0 (_1!6742 lt!223025) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223024 () Unit!8942)

(declare-fun lt!223030 () Unit!8942)

(assert (=> b!143828 (= lt!223024 lt!223030)))

(declare-fun lt!223029 () (_ BitVec 64))

(assert (=> b!143828 (validate_offset_bits!1 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!223031)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) lt!223029)))

(assert (=> b!143828 (= lt!223030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6741 lt!222443) (buf!3400 (_2!6741 lt!223031)) lt!223029))))

(declare-fun e!95799 () Bool)

(assert (=> b!143828 e!95799))

(declare-fun res!120149 () Bool)

(assert (=> b!143828 (=> (not res!120149) (not e!95799))))

(assert (=> b!143828 (= res!120149 (and (= (size!2971 (buf!3400 (_2!6741 lt!222443))) (size!2971 (buf!3400 (_2!6741 lt!223031)))) (bvsge lt!223029 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143828 (= lt!223029 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143828 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143828 (= lt!223025 (reader!0 (_2!6741 lt!222443) (_2!6741 lt!223031)))))

(declare-fun b!143829 () Bool)

(declare-fun res!120150 () Bool)

(assert (=> b!143829 (=> (not res!120150) (not e!95798))))

(declare-fun lt!223028 () (_ BitVec 64))

(declare-fun lt!223026 () (_ BitVec 64))

(assert (=> b!143829 (= res!120150 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!223031))) (currentByte!6284 (_2!6741 lt!223031)) (currentBit!6279 (_2!6741 lt!223031))) (bvadd lt!223028 lt!223026)))))

(assert (=> b!143829 (or (not (= (bvand lt!223028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223026 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223028 lt!223026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223023 () (_ BitVec 64))

(assert (=> b!143829 (= lt!223026 (bvmul lt!223023 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!143829 (or (= lt!223023 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223023 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223023)))))

(assert (=> b!143829 (= lt!223023 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143829 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143829 (= lt!223028 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))))))

(declare-fun b!143830 () Bool)

(assert (=> b!143830 (= e!95800 (arrayRangesEq!287 arr!237 (_2!6743 lt!223027) #b00000000000000000000000000000000 to!404))))

(declare-fun b!143831 () Bool)

(assert (=> b!143831 (= e!95799 (validate_offset_bits!1 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) lt!223029))))

(declare-fun b!143832 () Bool)

(declare-fun res!120151 () Bool)

(assert (=> b!143832 (=> (not res!120151) (not e!95798))))

(assert (=> b!143832 (= res!120151 (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!223031)))))

(assert (= (and d!45916 res!120153) b!143829))

(assert (= (and b!143829 res!120150) b!143832))

(assert (= (and b!143832 res!120151) b!143828))

(assert (= (and b!143828 res!120149) b!143831))

(assert (= (and b!143828 res!120152) b!143830))

(declare-fun m!220909 () Bool)

(assert (=> b!143829 m!220909))

(assert (=> b!143829 m!220385))

(declare-fun m!220911 () Bool)

(assert (=> b!143832 m!220911))

(declare-fun m!220913 () Bool)

(assert (=> b!143830 m!220913))

(declare-fun m!220915 () Bool)

(assert (=> b!143828 m!220915))

(declare-fun m!220917 () Bool)

(assert (=> b!143828 m!220917))

(declare-fun m!220919 () Bool)

(assert (=> b!143828 m!220919))

(declare-fun m!220921 () Bool)

(assert (=> b!143828 m!220921))

(declare-fun m!220923 () Bool)

(assert (=> d!45916 m!220923))

(declare-fun m!220925 () Bool)

(assert (=> b!143831 m!220925))

(assert (=> b!143543 d!45916))

(declare-fun d!45979 () Bool)

(declare-fun e!95803 () Bool)

(assert (=> d!45979 e!95803))

(declare-fun res!120156 () Bool)

(assert (=> d!45979 (=> (not res!120156) (not e!95803))))

(assert (=> d!45979 (= res!120156 (and (or (let ((rhs!3203 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3203 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3203) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45980 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45980 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45980 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3202 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3202) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!223040 () Unit!8942)

(declare-fun choose!57 (BitStream!5200 BitStream!5200 (_ BitVec 64) (_ BitVec 32)) Unit!8942)

(assert (=> d!45979 (= lt!223040 (choose!57 thiss!1634 (_2!6741 lt!222443) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45979 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6741 lt!222443) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!223040)))

(declare-fun b!143835 () Bool)

(declare-fun lt!223038 () (_ BitVec 32))

(assert (=> b!143835 (= e!95803 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) (bvsub (bvsub to!404 from!447) lt!223038)))))

(assert (=> b!143835 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!223038 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!223038) #b10000000000000000000000000000000)))))

(declare-fun lt!223039 () (_ BitVec 64))

(assert (=> b!143835 (= lt!223038 ((_ extract 31 0) lt!223039))))

(assert (=> b!143835 (and (bvslt lt!223039 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!223039 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!143835 (= lt!223039 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45979 res!120156) b!143835))

(declare-fun m!220927 () Bool)

(assert (=> d!45979 m!220927))

(declare-fun m!220929 () Bool)

(assert (=> b!143835 m!220929))

(assert (=> b!143543 d!45979))

(declare-fun d!45982 () Bool)

(assert (=> d!45982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!223043 () Unit!8942)

(declare-fun choose!26 (BitStream!5200 array!6563 (_ BitVec 32) BitStream!5200) Unit!8942)

(assert (=> d!45982 (= lt!223043 (choose!26 thiss!1634 (buf!3400 (_2!6741 lt!222445)) (bvsub to!404 from!447) (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634))))))

(assert (=> d!45982 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3400 (_2!6741 lt!222445)) (bvsub to!404 from!447)) lt!223043)))

(declare-fun bs!11283 () Bool)

(assert (= bs!11283 d!45982))

(assert (=> bs!11283 m!220395))

(declare-fun m!220931 () Bool)

(assert (=> bs!11283 m!220931))

(assert (=> b!143543 d!45982))

(declare-fun d!45984 () Bool)

(assert (=> d!45984 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222443)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11284 () Bool)

(assert (= bs!11284 d!45984))

(assert (=> bs!11284 m!220641))

(assert (=> b!143543 d!45984))

(declare-fun d!45986 () Bool)

(declare-fun e!95815 () Bool)

(assert (=> d!45986 e!95815))

(declare-fun res!120178 () Bool)

(assert (=> d!45986 (=> (not res!120178) (not e!95815))))

(declare-fun lt!223081 () tuple2!12800)

(assert (=> d!45986 (= res!120178 (= (size!2971 (buf!3400 thiss!1634)) (size!2971 (buf!3400 (_2!6741 lt!223081)))))))

(declare-fun choose!6 (BitStream!5200 (_ BitVec 8)) tuple2!12800)

(assert (=> d!45986 (= lt!223081 (choose!6 thiss!1634 (select (arr!3694 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45986 (validate_offset_byte!0 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)))))

(assert (=> d!45986 (= (appendByte!0 thiss!1634 (select (arr!3694 arr!237) from!447)) lt!223081)))

(declare-fun b!143857 () Bool)

(declare-fun res!120179 () Bool)

(assert (=> b!143857 (=> (not res!120179) (not e!95815))))

(declare-fun lt!223084 () (_ BitVec 64))

(declare-fun lt!223083 () (_ BitVec 64))

(assert (=> b!143857 (= res!120179 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!223081))) (currentByte!6284 (_2!6741 lt!223081)) (currentBit!6279 (_2!6741 lt!223081))) (bvadd lt!223083 lt!223084)))))

(assert (=> b!143857 (or (not (= (bvand lt!223083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223083 lt!223084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143857 (= lt!223084 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143857 (= lt!223083 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(declare-fun b!143858 () Bool)

(declare-fun res!120180 () Bool)

(assert (=> b!143858 (=> (not res!120180) (not e!95815))))

(assert (=> b!143858 (= res!120180 (isPrefixOf!0 thiss!1634 (_2!6741 lt!223081)))))

(declare-fun b!143859 () Bool)

(declare-fun lt!223085 () tuple2!12802)

(declare-fun lt!223082 () tuple2!12806)

(assert (=> b!143859 (= e!95815 (and (= (_2!6744 lt!223082) (select (arr!3694 arr!237) from!447)) (= (_1!6744 lt!223082) (_2!6742 lt!223085))))))

(assert (=> b!143859 (= lt!223082 (readBytePure!0 (_1!6742 lt!223085)))))

(assert (=> b!143859 (= lt!223085 (reader!0 thiss!1634 (_2!6741 lt!223081)))))

(assert (= (and d!45986 res!120178) b!143857))

(assert (= (and b!143857 res!120179) b!143858))

(assert (= (and b!143858 res!120180) b!143859))

(assert (=> d!45986 m!220415))

(declare-fun m!220951 () Bool)

(assert (=> d!45986 m!220951))

(declare-fun m!220953 () Bool)

(assert (=> d!45986 m!220953))

(declare-fun m!220955 () Bool)

(assert (=> b!143857 m!220955))

(assert (=> b!143857 m!220427))

(declare-fun m!220957 () Bool)

(assert (=> b!143858 m!220957))

(declare-fun m!220959 () Bool)

(assert (=> b!143859 m!220959))

(declare-fun m!220961 () Bool)

(assert (=> b!143859 m!220961))

(assert (=> b!143543 d!45986))

(declare-fun d!45990 () Bool)

(declare-fun lt!223086 () tuple2!12828)

(assert (=> d!45990 (= lt!223086 (readByte!0 lt!222441))))

(assert (=> d!45990 (= (readBytePure!0 lt!222441) (tuple2!12807 (_2!6756 lt!223086) (_1!6756 lt!223086)))))

(declare-fun bs!11285 () Bool)

(assert (= bs!11285 d!45990))

(declare-fun m!220963 () Bool)

(assert (=> bs!11285 m!220963))

(assert (=> b!143543 d!45990))

(declare-fun b!143860 () Bool)

(declare-fun lt!223101 () (_ BitVec 64))

(declare-fun e!95817 () Bool)

(declare-fun lt!223102 () (_ BitVec 64))

(declare-fun lt!223097 () tuple2!12802)

(assert (=> b!143860 (= e!95817 (= (_1!6742 lt!223097) (withMovedBitIndex!0 (_2!6742 lt!223097) (bvsub lt!223101 lt!223102))))))

(assert (=> b!143860 (or (= (bvand lt!223101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223102 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223101 lt!223102) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143860 (= lt!223102 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445))))))

(assert (=> b!143860 (= lt!223101 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(declare-fun b!143861 () Bool)

(declare-fun res!120181 () Bool)

(assert (=> b!143861 (=> (not res!120181) (not e!95817))))

(assert (=> b!143861 (= res!120181 (isPrefixOf!0 (_1!6742 lt!223097) thiss!1634))))

(declare-fun d!45992 () Bool)

(assert (=> d!45992 e!95817))

(declare-fun res!120182 () Bool)

(assert (=> d!45992 (=> (not res!120182) (not e!95817))))

(assert (=> d!45992 (= res!120182 (isPrefixOf!0 (_1!6742 lt!223097) (_2!6742 lt!223097)))))

(declare-fun lt!223105 () BitStream!5200)

(assert (=> d!45992 (= lt!223097 (tuple2!12803 lt!223105 (_2!6741 lt!222445)))))

(declare-fun lt!223095 () Unit!8942)

(declare-fun lt!223098 () Unit!8942)

(assert (=> d!45992 (= lt!223095 lt!223098)))

(assert (=> d!45992 (isPrefixOf!0 lt!223105 (_2!6741 lt!222445))))

(assert (=> d!45992 (= lt!223098 (lemmaIsPrefixTransitive!0 lt!223105 (_2!6741 lt!222445) (_2!6741 lt!222445)))))

(declare-fun lt!223104 () Unit!8942)

(declare-fun lt!223093 () Unit!8942)

(assert (=> d!45992 (= lt!223104 lt!223093)))

(assert (=> d!45992 (isPrefixOf!0 lt!223105 (_2!6741 lt!222445))))

(assert (=> d!45992 (= lt!223093 (lemmaIsPrefixTransitive!0 lt!223105 thiss!1634 (_2!6741 lt!222445)))))

(declare-fun lt!223106 () Unit!8942)

(declare-fun e!95816 () Unit!8942)

(assert (=> d!45992 (= lt!223106 e!95816)))

(declare-fun c!7855 () Bool)

(assert (=> d!45992 (= c!7855 (not (= (size!2971 (buf!3400 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!223103 () Unit!8942)

(declare-fun lt!223090 () Unit!8942)

(assert (=> d!45992 (= lt!223103 lt!223090)))

(assert (=> d!45992 (isPrefixOf!0 (_2!6741 lt!222445) (_2!6741 lt!222445))))

(assert (=> d!45992 (= lt!223090 (lemmaIsPrefixRefl!0 (_2!6741 lt!222445)))))

(declare-fun lt!223089 () Unit!8942)

(declare-fun lt!223094 () Unit!8942)

(assert (=> d!45992 (= lt!223089 lt!223094)))

(assert (=> d!45992 (= lt!223094 (lemmaIsPrefixRefl!0 (_2!6741 lt!222445)))))

(declare-fun lt!223099 () Unit!8942)

(declare-fun lt!223100 () Unit!8942)

(assert (=> d!45992 (= lt!223099 lt!223100)))

(assert (=> d!45992 (isPrefixOf!0 lt!223105 lt!223105)))

(assert (=> d!45992 (= lt!223100 (lemmaIsPrefixRefl!0 lt!223105))))

(declare-fun lt!223108 () Unit!8942)

(declare-fun lt!223091 () Unit!8942)

(assert (=> d!45992 (= lt!223108 lt!223091)))

(assert (=> d!45992 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45992 (= lt!223091 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45992 (= lt!223105 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(assert (=> d!45992 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222445))))

(assert (=> d!45992 (= (reader!0 thiss!1634 (_2!6741 lt!222445)) lt!223097)))

(declare-fun b!143862 () Bool)

(declare-fun res!120183 () Bool)

(assert (=> b!143862 (=> (not res!120183) (not e!95817))))

(assert (=> b!143862 (= res!120183 (isPrefixOf!0 (_2!6742 lt!223097) (_2!6741 lt!222445)))))

(declare-fun b!143863 () Bool)

(declare-fun lt!223096 () Unit!8942)

(assert (=> b!143863 (= e!95816 lt!223096)))

(declare-fun lt!223092 () (_ BitVec 64))

(assert (=> b!143863 (= lt!223092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223107 () (_ BitVec 64))

(assert (=> b!143863 (= lt!223107 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(assert (=> b!143863 (= lt!223096 (arrayBitRangesEqSymmetric!0 (buf!3400 thiss!1634) (buf!3400 (_2!6741 lt!222445)) lt!223092 lt!223107))))

(assert (=> b!143863 (arrayBitRangesEq!0 (buf!3400 (_2!6741 lt!222445)) (buf!3400 thiss!1634) lt!223092 lt!223107)))

(declare-fun b!143864 () Bool)

(declare-fun Unit!8954 () Unit!8942)

(assert (=> b!143864 (= e!95816 Unit!8954)))

(assert (= (and d!45992 c!7855) b!143863))

(assert (= (and d!45992 (not c!7855)) b!143864))

(assert (= (and d!45992 res!120182) b!143861))

(assert (= (and b!143861 res!120181) b!143862))

(assert (= (and b!143862 res!120183) b!143860))

(declare-fun m!220967 () Bool)

(assert (=> d!45992 m!220967))

(assert (=> d!45992 m!220413))

(declare-fun m!220969 () Bool)

(assert (=> d!45992 m!220969))

(assert (=> d!45992 m!220699))

(declare-fun m!220971 () Bool)

(assert (=> d!45992 m!220971))

(declare-fun m!220973 () Bool)

(assert (=> d!45992 m!220973))

(assert (=> d!45992 m!220705))

(declare-fun m!220975 () Bool)

(assert (=> d!45992 m!220975))

(declare-fun m!220977 () Bool)

(assert (=> d!45992 m!220977))

(declare-fun m!220979 () Bool)

(assert (=> d!45992 m!220979))

(declare-fun m!220981 () Bool)

(assert (=> d!45992 m!220981))

(declare-fun m!220983 () Bool)

(assert (=> b!143862 m!220983))

(declare-fun m!220985 () Bool)

(assert (=> b!143861 m!220985))

(assert (=> b!143863 m!220427))

(declare-fun m!220987 () Bool)

(assert (=> b!143863 m!220987))

(declare-fun m!220989 () Bool)

(assert (=> b!143863 m!220989))

(declare-fun m!220991 () Bool)

(assert (=> b!143860 m!220991))

(assert (=> b!143860 m!220383))

(assert (=> b!143860 m!220427))

(assert (=> b!143543 d!45992))

(declare-fun d!45996 () Bool)

(declare-datatypes ((tuple3!556 0))(
  ( (tuple3!557 (_1!6758 Unit!8942) (_2!6758 BitStream!5200) (_3!343 array!6563)) )
))
(declare-fun lt!223133 () tuple3!556)

(declare-fun readByteArrayLoop!0 (BitStream!5200 array!6563 (_ BitVec 32) (_ BitVec 32)) tuple3!556)

(assert (=> d!45996 (= lt!223133 (readByteArrayLoop!0 (_1!6742 lt!222446) arr!237 from!447 to!404))))

(assert (=> d!45996 (= (readByteArrayLoopPure!0 (_1!6742 lt!222446) arr!237 from!447 to!404) (tuple2!12805 (_2!6758 lt!223133) (_3!343 lt!223133)))))

(declare-fun bs!11290 () Bool)

(assert (= bs!11290 d!45996))

(declare-fun m!221019 () Bool)

(assert (=> bs!11290 m!221019))

(assert (=> b!143543 d!45996))

(declare-fun d!46006 () Bool)

(declare-fun lt!223134 () tuple2!12828)

(assert (=> d!46006 (= lt!223134 (readByte!0 (_1!6742 lt!222446)))))

(assert (=> d!46006 (= (readBytePure!0 (_1!6742 lt!222446)) (tuple2!12807 (_2!6756 lt!223134) (_1!6756 lt!223134)))))

(declare-fun bs!11291 () Bool)

(assert (= bs!11291 d!46006))

(declare-fun m!221021 () Bool)

(assert (=> bs!11291 m!221021))

(assert (=> b!143543 d!46006))

(declare-fun d!46008 () Bool)

(declare-fun res!120188 () Bool)

(declare-fun e!95820 () Bool)

(assert (=> d!46008 (=> (not res!120188) (not e!95820))))

(assert (=> d!46008 (= res!120188 (= (size!2971 (buf!3400 (_2!6741 lt!222443))) (size!2971 (buf!3400 (_2!6741 lt!222445)))))))

(assert (=> d!46008 (= (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!222445)) e!95820)))

(declare-fun b!143870 () Bool)

(declare-fun res!120187 () Bool)

(assert (=> b!143870 (=> (not res!120187) (not e!95820))))

(assert (=> b!143870 (= res!120187 (bvsle (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))) (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445)))))))

(declare-fun b!143871 () Bool)

(declare-fun e!95821 () Bool)

(assert (=> b!143871 (= e!95820 e!95821)))

(declare-fun res!120189 () Bool)

(assert (=> b!143871 (=> res!120189 e!95821)))

(assert (=> b!143871 (= res!120189 (= (size!2971 (buf!3400 (_2!6741 lt!222443))) #b00000000000000000000000000000000))))

(declare-fun b!143872 () Bool)

(assert (=> b!143872 (= e!95821 (arrayBitRangesEq!0 (buf!3400 (_2!6741 lt!222443)) (buf!3400 (_2!6741 lt!222445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443)))))))

(assert (= (and d!46008 res!120188) b!143870))

(assert (= (and b!143870 res!120187) b!143871))

(assert (= (and b!143871 (not res!120189)) b!143872))

(assert (=> b!143870 m!220385))

(assert (=> b!143870 m!220383))

(assert (=> b!143872 m!220385))

(assert (=> b!143872 m!220385))

(declare-fun m!221023 () Bool)

(assert (=> b!143872 m!221023))

(assert (=> b!143554 d!46008))

(declare-fun d!46010 () Bool)

(assert (=> d!46010 (= (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 (_2!6741 lt!222443)))) (and (bvsge (currentBit!6279 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6279 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6284 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6284 thiss!1634) (size!2971 (buf!3400 (_2!6741 lt!222443)))) (and (= (currentBit!6279 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6284 thiss!1634) (size!2971 (buf!3400 (_2!6741 lt!222443))))))))))

(assert (=> b!143553 d!46010))

(declare-fun d!46012 () Bool)

(assert (=> d!46012 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 thiss!1634))) ((_ sign_extend 32) (currentByte!6284 thiss!1634)) ((_ sign_extend 32) (currentBit!6279 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11292 () Bool)

(assert (= bs!11292 d!46012))

(assert (=> bs!11292 m!220649))

(assert (=> b!143550 d!46012))

(declare-fun d!46014 () Bool)

(declare-fun lt!223143 () tuple3!556)

(assert (=> d!46014 (= lt!223143 (readByteArrayLoop!0 (_1!6742 lt!222435) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46014 (= (readByteArrayLoopPure!0 (_1!6742 lt!222435) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12805 (_2!6758 lt!223143) (_3!343 lt!223143)))))

(declare-fun bs!11293 () Bool)

(assert (= bs!11293 d!46014))

(declare-fun m!221025 () Bool)

(assert (=> bs!11293 m!221025))

(assert (=> b!143551 d!46014))

(declare-fun d!46016 () Bool)

(assert (=> d!46016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) lt!222437) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443)))) lt!222437))))

(declare-fun bs!11294 () Bool)

(assert (= bs!11294 d!46016))

(declare-fun m!221027 () Bool)

(assert (=> bs!11294 m!221027))

(assert (=> b!143551 d!46016))

(declare-fun d!46018 () Bool)

(assert (=> d!46018 (validate_offset_bits!1 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222443))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222443))) lt!222437)))

(declare-fun lt!223157 () Unit!8942)

(declare-fun choose!9 (BitStream!5200 array!6563 (_ BitVec 64) BitStream!5200) Unit!8942)

(assert (=> d!46018 (= lt!223157 (choose!9 (_2!6741 lt!222443) (buf!3400 (_2!6741 lt!222445)) lt!222437 (BitStream!5201 (buf!3400 (_2!6741 lt!222445)) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443)))))))

(assert (=> d!46018 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6741 lt!222443) (buf!3400 (_2!6741 lt!222445)) lt!222437) lt!223157)))

(declare-fun bs!11296 () Bool)

(assert (= bs!11296 d!46018))

(assert (=> bs!11296 m!220433))

(declare-fun m!221043 () Bool)

(assert (=> bs!11296 m!221043))

(assert (=> b!143551 d!46018))

(assert (=> b!143551 d!45906))

(declare-fun d!46026 () Bool)

(declare-fun res!120199 () Bool)

(declare-fun e!95830 () Bool)

(assert (=> d!46026 (=> res!120199 e!95830)))

(assert (=> d!46026 (= res!120199 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46026 (= (arrayRangesEq!287 arr!237 (_2!6743 lt!222438) #b00000000000000000000000000000000 to!404) e!95830)))

(declare-fun b!143882 () Bool)

(declare-fun e!95831 () Bool)

(assert (=> b!143882 (= e!95830 e!95831)))

(declare-fun res!120200 () Bool)

(assert (=> b!143882 (=> (not res!120200) (not e!95831))))

(assert (=> b!143882 (= res!120200 (= (select (arr!3694 arr!237) #b00000000000000000000000000000000) (select (arr!3694 (_2!6743 lt!222438)) #b00000000000000000000000000000000)))))

(declare-fun b!143883 () Bool)

(assert (=> b!143883 (= e!95831 (arrayRangesEq!287 arr!237 (_2!6743 lt!222438) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46026 (not res!120199)) b!143882))

(assert (= (and b!143882 res!120200) b!143883))

(declare-fun m!221045 () Bool)

(assert (=> b!143882 m!221045))

(declare-fun m!221047 () Bool)

(assert (=> b!143882 m!221047))

(declare-fun m!221049 () Bool)

(assert (=> b!143883 m!221049))

(assert (=> b!143547 d!46026))

(declare-fun d!46028 () Bool)

(assert (=> d!46028 (= (invariant!0 (currentBit!6279 thiss!1634) (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634))) (and (bvsge (currentBit!6279 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6279 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6284 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634))) (and (= (currentBit!6279 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6284 thiss!1634) (size!2971 (buf!3400 thiss!1634)))))))))

(assert (=> b!143548 d!46028))

(declare-fun d!46031 () Bool)

(declare-fun e!95832 () Bool)

(assert (=> d!46031 e!95832))

(declare-fun res!120201 () Bool)

(assert (=> d!46031 (=> (not res!120201) (not e!95832))))

(declare-fun lt!223159 () (_ BitVec 64))

(declare-fun lt!223158 () (_ BitVec 64))

(declare-fun lt!223162 () (_ BitVec 64))

(assert (=> d!46031 (= res!120201 (= lt!223158 (bvsub lt!223159 lt!223162)))))

(assert (=> d!46031 (or (= (bvand lt!223159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223159 lt!223162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46031 (= lt!223162 (remainingBits!0 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))) ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222445))) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222445)))))))

(declare-fun lt!223161 () (_ BitVec 64))

(declare-fun lt!223160 () (_ BitVec 64))

(assert (=> d!46031 (= lt!223159 (bvmul lt!223161 lt!223160))))

(assert (=> d!46031 (or (= lt!223161 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223160 (bvsdiv (bvmul lt!223161 lt!223160) lt!223161)))))

(assert (=> d!46031 (= lt!223160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46031 (= lt!223161 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))))))

(assert (=> d!46031 (= lt!223158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6284 (_2!6741 lt!222445))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6279 (_2!6741 lt!222445)))))))

(assert (=> d!46031 (invariant!0 (currentBit!6279 (_2!6741 lt!222445)) (currentByte!6284 (_2!6741 lt!222445)) (size!2971 (buf!3400 (_2!6741 lt!222445))))))

(assert (=> d!46031 (= (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222445))) (currentByte!6284 (_2!6741 lt!222445)) (currentBit!6279 (_2!6741 lt!222445))) lt!223158)))

(declare-fun b!143884 () Bool)

(declare-fun res!120202 () Bool)

(assert (=> b!143884 (=> (not res!120202) (not e!95832))))

(assert (=> b!143884 (= res!120202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223158))))

(declare-fun b!143885 () Bool)

(declare-fun lt!223163 () (_ BitVec 64))

(assert (=> b!143885 (= e!95832 (bvsle lt!223158 (bvmul lt!223163 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143885 (or (= lt!223163 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223163 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223163)))))

(assert (=> b!143885 (= lt!223163 ((_ sign_extend 32) (size!2971 (buf!3400 (_2!6741 lt!222445)))))))

(assert (= (and d!46031 res!120201) b!143884))

(assert (= (and b!143884 res!120202) b!143885))

(declare-fun m!221051 () Bool)

(assert (=> d!46031 m!221051))

(declare-fun m!221053 () Bool)

(assert (=> d!46031 m!221053))

(assert (=> b!143555 d!46031))

(assert (=> b!143555 d!45860))

(declare-fun d!46033 () Bool)

(assert (=> d!46033 (= (array_inv!2760 (buf!3400 thiss!1634)) (bvsge (size!2971 (buf!3400 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!143544 d!46033))

(declare-fun d!46035 () Bool)

(declare-fun lt!223164 () tuple2!12828)

(assert (=> d!46035 (= lt!223164 (readByte!0 (_1!6742 lt!222447)))))

(assert (=> d!46035 (= (readBytePure!0 (_1!6742 lt!222447)) (tuple2!12807 (_2!6756 lt!223164) (_1!6756 lt!223164)))))

(declare-fun bs!11297 () Bool)

(assert (= bs!11297 d!46035))

(declare-fun m!221055 () Bool)

(assert (=> bs!11297 m!221055))

(assert (=> b!143545 d!46035))

(declare-fun e!95834 () Bool)

(declare-fun lt!223177 () (_ BitVec 64))

(declare-fun lt!223173 () tuple2!12802)

(declare-fun lt!223178 () (_ BitVec 64))

(declare-fun b!143886 () Bool)

(assert (=> b!143886 (= e!95834 (= (_1!6742 lt!223173) (withMovedBitIndex!0 (_2!6742 lt!223173) (bvsub lt!223177 lt!223178))))))

(assert (=> b!143886 (or (= (bvand lt!223177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223178 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223177 lt!223178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143886 (= lt!223178 (bitIndex!0 (size!2971 (buf!3400 (_2!6741 lt!222443))) (currentByte!6284 (_2!6741 lt!222443)) (currentBit!6279 (_2!6741 lt!222443))))))

(assert (=> b!143886 (= lt!223177 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(declare-fun b!143887 () Bool)

(declare-fun res!120203 () Bool)

(assert (=> b!143887 (=> (not res!120203) (not e!95834))))

(assert (=> b!143887 (= res!120203 (isPrefixOf!0 (_1!6742 lt!223173) thiss!1634))))

(declare-fun d!46037 () Bool)

(assert (=> d!46037 e!95834))

(declare-fun res!120204 () Bool)

(assert (=> d!46037 (=> (not res!120204) (not e!95834))))

(assert (=> d!46037 (= res!120204 (isPrefixOf!0 (_1!6742 lt!223173) (_2!6742 lt!223173)))))

(declare-fun lt!223181 () BitStream!5200)

(assert (=> d!46037 (= lt!223173 (tuple2!12803 lt!223181 (_2!6741 lt!222443)))))

(declare-fun lt!223171 () Unit!8942)

(declare-fun lt!223174 () Unit!8942)

(assert (=> d!46037 (= lt!223171 lt!223174)))

(assert (=> d!46037 (isPrefixOf!0 lt!223181 (_2!6741 lt!222443))))

(assert (=> d!46037 (= lt!223174 (lemmaIsPrefixTransitive!0 lt!223181 (_2!6741 lt!222443) (_2!6741 lt!222443)))))

(declare-fun lt!223180 () Unit!8942)

(declare-fun lt!223169 () Unit!8942)

(assert (=> d!46037 (= lt!223180 lt!223169)))

(assert (=> d!46037 (isPrefixOf!0 lt!223181 (_2!6741 lt!222443))))

(assert (=> d!46037 (= lt!223169 (lemmaIsPrefixTransitive!0 lt!223181 thiss!1634 (_2!6741 lt!222443)))))

(declare-fun lt!223182 () Unit!8942)

(declare-fun e!95833 () Unit!8942)

(assert (=> d!46037 (= lt!223182 e!95833)))

(declare-fun c!7857 () Bool)

(assert (=> d!46037 (= c!7857 (not (= (size!2971 (buf!3400 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!223179 () Unit!8942)

(declare-fun lt!223166 () Unit!8942)

(assert (=> d!46037 (= lt!223179 lt!223166)))

(assert (=> d!46037 (isPrefixOf!0 (_2!6741 lt!222443) (_2!6741 lt!222443))))

(assert (=> d!46037 (= lt!223166 (lemmaIsPrefixRefl!0 (_2!6741 lt!222443)))))

(declare-fun lt!223165 () Unit!8942)

(declare-fun lt!223170 () Unit!8942)

(assert (=> d!46037 (= lt!223165 lt!223170)))

(assert (=> d!46037 (= lt!223170 (lemmaIsPrefixRefl!0 (_2!6741 lt!222443)))))

(declare-fun lt!223175 () Unit!8942)

(declare-fun lt!223176 () Unit!8942)

(assert (=> d!46037 (= lt!223175 lt!223176)))

(assert (=> d!46037 (isPrefixOf!0 lt!223181 lt!223181)))

(assert (=> d!46037 (= lt!223176 (lemmaIsPrefixRefl!0 lt!223181))))

(declare-fun lt!223184 () Unit!8942)

(declare-fun lt!223167 () Unit!8942)

(assert (=> d!46037 (= lt!223184 lt!223167)))

(assert (=> d!46037 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46037 (= lt!223167 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46037 (= lt!223181 (BitStream!5201 (buf!3400 (_2!6741 lt!222443)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(assert (=> d!46037 (isPrefixOf!0 thiss!1634 (_2!6741 lt!222443))))

(assert (=> d!46037 (= (reader!0 thiss!1634 (_2!6741 lt!222443)) lt!223173)))

(declare-fun b!143888 () Bool)

(declare-fun res!120205 () Bool)

(assert (=> b!143888 (=> (not res!120205) (not e!95834))))

(assert (=> b!143888 (= res!120205 (isPrefixOf!0 (_2!6742 lt!223173) (_2!6741 lt!222443)))))

(declare-fun b!143889 () Bool)

(declare-fun lt!223172 () Unit!8942)

(assert (=> b!143889 (= e!95833 lt!223172)))

(declare-fun lt!223168 () (_ BitVec 64))

(assert (=> b!143889 (= lt!223168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223183 () (_ BitVec 64))

(assert (=> b!143889 (= lt!223183 (bitIndex!0 (size!2971 (buf!3400 thiss!1634)) (currentByte!6284 thiss!1634) (currentBit!6279 thiss!1634)))))

(assert (=> b!143889 (= lt!223172 (arrayBitRangesEqSymmetric!0 (buf!3400 thiss!1634) (buf!3400 (_2!6741 lt!222443)) lt!223168 lt!223183))))

(assert (=> b!143889 (arrayBitRangesEq!0 (buf!3400 (_2!6741 lt!222443)) (buf!3400 thiss!1634) lt!223168 lt!223183)))

(declare-fun b!143890 () Bool)

(declare-fun Unit!8956 () Unit!8942)

(assert (=> b!143890 (= e!95833 Unit!8956)))

(assert (= (and d!46037 c!7857) b!143889))

(assert (= (and d!46037 (not c!7857)) b!143890))

(assert (= (and d!46037 res!120204) b!143887))

(assert (= (and b!143887 res!120203) b!143888))

(assert (= (and b!143888 res!120205) b!143886))

(declare-fun m!221057 () Bool)

(assert (=> d!46037 m!221057))

(assert (=> d!46037 m!220429))

(assert (=> d!46037 m!220969))

(assert (=> d!46037 m!220697))

(declare-fun m!221059 () Bool)

(assert (=> d!46037 m!221059))

(declare-fun m!221061 () Bool)

(assert (=> d!46037 m!221061))

(assert (=> d!46037 m!220709))

(declare-fun m!221063 () Bool)

(assert (=> d!46037 m!221063))

(assert (=> d!46037 m!220977))

(declare-fun m!221065 () Bool)

(assert (=> d!46037 m!221065))

(declare-fun m!221067 () Bool)

(assert (=> d!46037 m!221067))

(declare-fun m!221069 () Bool)

(assert (=> b!143888 m!221069))

(declare-fun m!221071 () Bool)

(assert (=> b!143887 m!221071))

(assert (=> b!143889 m!220427))

(declare-fun m!221073 () Bool)

(assert (=> b!143889 m!221073))

(declare-fun m!221075 () Bool)

(assert (=> b!143889 m!221075))

(declare-fun m!221077 () Bool)

(assert (=> b!143886 m!221077))

(assert (=> b!143886 m!220385))

(assert (=> b!143886 m!220427))

(assert (=> b!143545 d!46037))

(push 1)

(assert (not d!46037))

(assert (not d!46035))

(assert (not d!45990))

(assert (not b!143832))

(assert (not b!143828))

(assert (not d!45872))

(assert (not d!45996))

(assert (not b!143707))

(assert (not b!143863))

(assert (not d!45912))

(assert (not b!143835))

(assert (not b!143859))

(assert (not b!143889))

(assert (not b!143872))

(assert (not d!45984))

(assert (not b!143709))

(assert (not d!45986))

(assert (not d!45888))

(assert (not d!45979))

(assert (not d!45992))

(assert (not b!143829))

(assert (not b!143858))

(assert (not d!45860))

(assert (not d!45904))

(assert (not d!45982))

(assert (not b!143886))

(assert (not d!45892))

(assert (not d!46031))

(assert (not b!143723))

(assert (not d!46012))

(assert (not b!143722))

(assert (not d!45908))

(assert (not b!143860))

(assert (not d!46006))

(assert (not b!143883))

(assert (not b!143831))

(assert (not b!143861))

(assert (not d!45900))

(assert (not b!143862))

(assert (not b!143870))

(assert (not b!143887))

(assert (not b!143830))

(assert (not b!143690))

(assert (not d!45906))

(assert (not d!46018))

(assert (not b!143720))

(assert (not b!143721))

(assert (not b!143857))

(assert (not d!46014))

(assert (not d!45916))

(assert (not b!143888))

(assert (not d!46016))

(assert (not d!45890))

(assert (not b!143688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

