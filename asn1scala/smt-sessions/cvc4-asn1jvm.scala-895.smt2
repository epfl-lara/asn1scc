; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25448 () Bool)

(assert start!25448)

(declare-fun b!128476 () Bool)

(declare-fun res!106330 () Bool)

(declare-fun e!85165 () Bool)

(assert (=> b!128476 (=> (not res!106330) (not e!85165))))

(declare-datatypes ((array!5933 0))(
  ( (array!5934 (arr!3299 (Array (_ BitVec 32) (_ BitVec 8))) (size!2682 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4628 0))(
  ( (BitStream!4629 (buf!3040 array!5933) (currentByte!5801 (_ BitVec 32)) (currentBit!5796 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7969 0))(
  ( (Unit!7970) )
))
(declare-datatypes ((tuple2!10858 0))(
  ( (tuple2!10859 (_1!5726 Unit!7969) (_2!5726 BitStream!4628)) )
))
(declare-fun lt!199447 () tuple2!10858)

(declare-fun thiss!1634 () BitStream!4628)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128476 (= res!106330 (= (bitIndex!0 (size!2682 (buf!3040 (_2!5726 lt!199447))) (currentByte!5801 (_2!5726 lt!199447)) (currentBit!5796 (_2!5726 lt!199447))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2682 (buf!3040 thiss!1634)) (currentByte!5801 thiss!1634) (currentBit!5796 thiss!1634)))))))

(declare-fun b!128477 () Bool)

(declare-fun res!106328 () Bool)

(assert (=> b!128477 (=> (not res!106328) (not e!85165))))

(declare-fun isPrefixOf!0 (BitStream!4628 BitStream!4628) Bool)

(assert (=> b!128477 (= res!106328 (isPrefixOf!0 thiss!1634 (_2!5726 lt!199447)))))

(declare-fun b!128478 () Bool)

(declare-fun res!106329 () Bool)

(declare-fun e!85164 () Bool)

(assert (=> b!128478 (=> (not res!106329) (not e!85164))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128478 (= res!106329 (bvslt from!447 to!404))))

(declare-fun b!128479 () Bool)

(assert (=> b!128479 (= e!85164 (not true))))

(assert (=> b!128479 e!85165))

(declare-fun res!106327 () Bool)

(assert (=> b!128479 (=> (not res!106327) (not e!85165))))

(assert (=> b!128479 (= res!106327 (= (size!2682 (buf!3040 thiss!1634)) (size!2682 (buf!3040 (_2!5726 lt!199447)))))))

(declare-fun arr!237 () array!5933)

(declare-fun appendByte!0 (BitStream!4628 (_ BitVec 8)) tuple2!10858)

(assert (=> b!128479 (= lt!199447 (appendByte!0 thiss!1634 (select (arr!3299 arr!237) from!447)))))

(declare-datatypes ((tuple2!10860 0))(
  ( (tuple2!10861 (_1!5727 BitStream!4628) (_2!5727 BitStream!4628)) )
))
(declare-fun lt!199448 () tuple2!10860)

(declare-fun b!128480 () Bool)

(declare-datatypes ((tuple2!10862 0))(
  ( (tuple2!10863 (_1!5728 BitStream!4628) (_2!5728 (_ BitVec 8))) )
))
(declare-fun lt!199446 () tuple2!10862)

(assert (=> b!128480 (= e!85165 (and (= (_2!5728 lt!199446) (select (arr!3299 arr!237) from!447)) (= (_1!5728 lt!199446) (_2!5727 lt!199448))))))

(declare-fun readBytePure!0 (BitStream!4628) tuple2!10862)

(assert (=> b!128480 (= lt!199446 (readBytePure!0 (_1!5727 lt!199448)))))

(declare-fun reader!0 (BitStream!4628 BitStream!4628) tuple2!10860)

(assert (=> b!128480 (= lt!199448 (reader!0 thiss!1634 (_2!5726 lt!199447)))))

(declare-fun res!106332 () Bool)

(assert (=> start!25448 (=> (not res!106332) (not e!85164))))

(assert (=> start!25448 (= res!106332 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2682 arr!237))))))

(assert (=> start!25448 e!85164))

(assert (=> start!25448 true))

(declare-fun array_inv!2471 (array!5933) Bool)

(assert (=> start!25448 (array_inv!2471 arr!237)))

(declare-fun e!85166 () Bool)

(declare-fun inv!12 (BitStream!4628) Bool)

(assert (=> start!25448 (and (inv!12 thiss!1634) e!85166)))

(declare-fun b!128481 () Bool)

(declare-fun res!106333 () Bool)

(assert (=> b!128481 (=> (not res!106333) (not e!85164))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128481 (= res!106333 (invariant!0 (currentBit!5796 thiss!1634) (currentByte!5801 thiss!1634) (size!2682 (buf!3040 thiss!1634))))))

(declare-fun b!128482 () Bool)

(declare-fun res!106331 () Bool)

(assert (=> b!128482 (=> (not res!106331) (not e!85164))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128482 (= res!106331 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2682 (buf!3040 thiss!1634))) ((_ sign_extend 32) (currentByte!5801 thiss!1634)) ((_ sign_extend 32) (currentBit!5796 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128483 () Bool)

(assert (=> b!128483 (= e!85166 (array_inv!2471 (buf!3040 thiss!1634)))))

(assert (= (and start!25448 res!106332) b!128482))

(assert (= (and b!128482 res!106331) b!128478))

(assert (= (and b!128478 res!106329) b!128481))

(assert (= (and b!128481 res!106333) b!128479))

(assert (= (and b!128479 res!106327) b!128476))

(assert (= (and b!128476 res!106330) b!128477))

(assert (= (and b!128477 res!106328) b!128480))

(assert (= start!25448 b!128483))

(declare-fun m!194269 () Bool)

(assert (=> b!128479 m!194269))

(assert (=> b!128479 m!194269))

(declare-fun m!194271 () Bool)

(assert (=> b!128479 m!194271))

(declare-fun m!194273 () Bool)

(assert (=> b!128481 m!194273))

(declare-fun m!194275 () Bool)

(assert (=> start!25448 m!194275))

(declare-fun m!194277 () Bool)

(assert (=> start!25448 m!194277))

(declare-fun m!194279 () Bool)

(assert (=> b!128483 m!194279))

(declare-fun m!194281 () Bool)

(assert (=> b!128482 m!194281))

(declare-fun m!194283 () Bool)

(assert (=> b!128477 m!194283))

(declare-fun m!194285 () Bool)

(assert (=> b!128476 m!194285))

(declare-fun m!194287 () Bool)

(assert (=> b!128476 m!194287))

(assert (=> b!128480 m!194269))

(declare-fun m!194289 () Bool)

(assert (=> b!128480 m!194289))

(declare-fun m!194291 () Bool)

(assert (=> b!128480 m!194291))

(push 1)

(assert (not b!128480))

(assert (not b!128479))

(assert (not start!25448))

(assert (not b!128477))

(assert (not b!128481))

(assert (not b!128482))

(assert (not b!128483))

(assert (not b!128476))

(check-sat)

(pop 1)

