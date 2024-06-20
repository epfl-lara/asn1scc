; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25452 () Bool)

(assert start!25452)

(declare-fun b!128529 () Bool)

(declare-fun e!85202 () Bool)

(assert (=> b!128529 (= e!85202 true)))

(declare-fun lt!199469 () (_ BitVec 64))

(declare-datatypes ((array!5937 0))(
  ( (array!5938 (arr!3301 (Array (_ BitVec 32) (_ BitVec 8))) (size!2684 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4632 0))(
  ( (BitStream!4633 (buf!3042 array!5937) (currentByte!5803 (_ BitVec 32)) (currentBit!5798 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4632)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128529 (= lt!199469 (bitIndex!0 (size!2684 (buf!3042 thiss!1634)) (currentByte!5803 thiss!1634) (currentBit!5798 thiss!1634)))))

(declare-datatypes ((tuple2!10870 0))(
  ( (tuple2!10871 (_1!5732 BitStream!4632) (_2!5732 (_ BitVec 8))) )
))
(declare-fun lt!199471 () tuple2!10870)

(declare-fun arr!237 () array!5937)

(declare-datatypes ((tuple2!10872 0))(
  ( (tuple2!10873 (_1!5733 BitStream!4632) (_2!5733 BitStream!4632)) )
))
(declare-fun lt!199470 () tuple2!10872)

(declare-fun b!128530 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!85199 () Bool)

(assert (=> b!128530 (= e!85199 (and (= (_2!5732 lt!199471) (select (arr!3301 arr!237) from!447)) (= (_1!5732 lt!199471) (_2!5733 lt!199470))))))

(declare-fun readBytePure!0 (BitStream!4632) tuple2!10870)

(assert (=> b!128530 (= lt!199471 (readBytePure!0 (_1!5733 lt!199470)))))

(declare-datatypes ((Unit!7973 0))(
  ( (Unit!7974) )
))
(declare-datatypes ((tuple2!10874 0))(
  ( (tuple2!10875 (_1!5734 Unit!7973) (_2!5734 BitStream!4632)) )
))
(declare-fun lt!199472 () tuple2!10874)

(declare-fun reader!0 (BitStream!4632 BitStream!4632) tuple2!10872)

(assert (=> b!128530 (= lt!199470 (reader!0 thiss!1634 (_2!5734 lt!199472)))))

(declare-fun b!128531 () Bool)

(declare-fun res!106379 () Bool)

(declare-fun e!85198 () Bool)

(assert (=> b!128531 (=> (not res!106379) (not e!85198))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128531 (= res!106379 (invariant!0 (currentBit!5798 thiss!1634) (currentByte!5803 thiss!1634) (size!2684 (buf!3042 thiss!1634))))))

(declare-fun b!128532 () Bool)

(declare-fun res!106375 () Bool)

(assert (=> b!128532 (=> (not res!106375) (not e!85199))))

(declare-fun isPrefixOf!0 (BitStream!4632 BitStream!4632) Bool)

(assert (=> b!128532 (= res!106375 (isPrefixOf!0 thiss!1634 (_2!5734 lt!199472)))))

(declare-fun b!128533 () Bool)

(declare-fun e!85197 () Bool)

(declare-fun array_inv!2473 (array!5937) Bool)

(assert (=> b!128533 (= e!85197 (array_inv!2473 (buf!3042 thiss!1634)))))

(declare-fun res!106380 () Bool)

(assert (=> start!25452 (=> (not res!106380) (not e!85198))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25452 (= res!106380 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2684 arr!237))))))

(assert (=> start!25452 e!85198))

(assert (=> start!25452 true))

(assert (=> start!25452 (array_inv!2473 arr!237)))

(declare-fun inv!12 (BitStream!4632) Bool)

(assert (=> start!25452 (and (inv!12 thiss!1634) e!85197)))

(declare-fun b!128534 () Bool)

(declare-fun res!106377 () Bool)

(assert (=> b!128534 (=> (not res!106377) (not e!85198))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128534 (= res!106377 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2684 (buf!3042 thiss!1634))) ((_ sign_extend 32) (currentByte!5803 thiss!1634)) ((_ sign_extend 32) (currentBit!5798 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128535 () Bool)

(declare-fun res!106374 () Bool)

(assert (=> b!128535 (=> (not res!106374) (not e!85199))))

(assert (=> b!128535 (= res!106374 (= (bitIndex!0 (size!2684 (buf!3042 (_2!5734 lt!199472))) (currentByte!5803 (_2!5734 lt!199472)) (currentBit!5798 (_2!5734 lt!199472))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2684 (buf!3042 thiss!1634)) (currentByte!5803 thiss!1634) (currentBit!5798 thiss!1634)))))))

(declare-fun b!128536 () Bool)

(assert (=> b!128536 (= e!85198 (not e!85202))))

(declare-fun res!106376 () Bool)

(assert (=> b!128536 (=> res!106376 e!85202)))

(assert (=> b!128536 (= res!106376 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2684 (buf!3042 (_2!5734 lt!199472))) (currentByte!5803 (_2!5734 lt!199472)) (currentBit!5798 (_2!5734 lt!199472)))))))

(assert (=> b!128536 e!85199))

(declare-fun res!106378 () Bool)

(assert (=> b!128536 (=> (not res!106378) (not e!85199))))

(assert (=> b!128536 (= res!106378 (= (size!2684 (buf!3042 thiss!1634)) (size!2684 (buf!3042 (_2!5734 lt!199472)))))))

(declare-fun appendByte!0 (BitStream!4632 (_ BitVec 8)) tuple2!10874)

(assert (=> b!128536 (= lt!199472 (appendByte!0 thiss!1634 (select (arr!3301 arr!237) from!447)))))

(declare-fun b!128537 () Bool)

(declare-fun res!106381 () Bool)

(assert (=> b!128537 (=> (not res!106381) (not e!85198))))

(assert (=> b!128537 (= res!106381 (bvslt from!447 to!404))))

(assert (= (and start!25452 res!106380) b!128534))

(assert (= (and b!128534 res!106377) b!128537))

(assert (= (and b!128537 res!106381) b!128531))

(assert (= (and b!128531 res!106379) b!128536))

(assert (= (and b!128536 res!106378) b!128535))

(assert (= (and b!128535 res!106374) b!128532))

(assert (= (and b!128532 res!106375) b!128530))

(assert (= (and b!128536 (not res!106376)) b!128529))

(assert (= start!25452 b!128533))

(declare-fun m!194317 () Bool)

(assert (=> b!128529 m!194317))

(declare-fun m!194319 () Bool)

(assert (=> b!128535 m!194319))

(assert (=> b!128535 m!194317))

(declare-fun m!194321 () Bool)

(assert (=> start!25452 m!194321))

(declare-fun m!194323 () Bool)

(assert (=> start!25452 m!194323))

(declare-fun m!194325 () Bool)

(assert (=> b!128532 m!194325))

(declare-fun m!194327 () Bool)

(assert (=> b!128533 m!194327))

(assert (=> b!128536 m!194319))

(declare-fun m!194329 () Bool)

(assert (=> b!128536 m!194329))

(assert (=> b!128536 m!194329))

(declare-fun m!194331 () Bool)

(assert (=> b!128536 m!194331))

(assert (=> b!128530 m!194329))

(declare-fun m!194333 () Bool)

(assert (=> b!128530 m!194333))

(declare-fun m!194335 () Bool)

(assert (=> b!128530 m!194335))

(declare-fun m!194337 () Bool)

(assert (=> b!128534 m!194337))

(declare-fun m!194339 () Bool)

(assert (=> b!128531 m!194339))

(check-sat (not b!128536) (not start!25452) (not b!128532) (not b!128534) (not b!128529) (not b!128533) (not b!128535) (not b!128531) (not b!128530))
