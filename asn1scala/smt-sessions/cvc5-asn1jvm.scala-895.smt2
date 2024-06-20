; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25444 () Bool)

(assert start!25444)

(declare-fun b!128428 () Bool)

(declare-fun res!106286 () Bool)

(declare-fun e!85132 () Bool)

(assert (=> b!128428 (=> (not res!106286) (not e!85132))))

(declare-datatypes ((array!5929 0))(
  ( (array!5930 (arr!3297 (Array (_ BitVec 32) (_ BitVec 8))) (size!2680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4624 0))(
  ( (BitStream!4625 (buf!3038 array!5929) (currentByte!5799 (_ BitVec 32)) (currentBit!5794 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4624)

(declare-datatypes ((Unit!7965 0))(
  ( (Unit!7966) )
))
(declare-datatypes ((tuple2!10846 0))(
  ( (tuple2!10847 (_1!5720 Unit!7965) (_2!5720 BitStream!4624)) )
))
(declare-fun lt!199429 () tuple2!10846)

(declare-fun isPrefixOf!0 (BitStream!4624 BitStream!4624) Bool)

(assert (=> b!128428 (= res!106286 (isPrefixOf!0 thiss!1634 (_2!5720 lt!199429)))))

(declare-fun res!106291 () Bool)

(declare-fun e!85134 () Bool)

(assert (=> start!25444 (=> (not res!106291) (not e!85134))))

(declare-fun arr!237 () array!5929)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25444 (= res!106291 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2680 arr!237))))))

(assert (=> start!25444 e!85134))

(assert (=> start!25444 true))

(declare-fun array_inv!2469 (array!5929) Bool)

(assert (=> start!25444 (array_inv!2469 arr!237)))

(declare-fun e!85136 () Bool)

(declare-fun inv!12 (BitStream!4624) Bool)

(assert (=> start!25444 (and (inv!12 thiss!1634) e!85136)))

(declare-fun b!128429 () Bool)

(assert (=> b!128429 (= e!85134 (not true))))

(assert (=> b!128429 e!85132))

(declare-fun res!106290 () Bool)

(assert (=> b!128429 (=> (not res!106290) (not e!85132))))

(assert (=> b!128429 (= res!106290 (= (size!2680 (buf!3038 thiss!1634)) (size!2680 (buf!3038 (_2!5720 lt!199429)))))))

(declare-fun appendByte!0 (BitStream!4624 (_ BitVec 8)) tuple2!10846)

(assert (=> b!128429 (= lt!199429 (appendByte!0 thiss!1634 (select (arr!3297 arr!237) from!447)))))

(declare-fun b!128430 () Bool)

(declare-fun res!106288 () Bool)

(assert (=> b!128430 (=> (not res!106288) (not e!85132))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128430 (= res!106288 (= (bitIndex!0 (size!2680 (buf!3038 (_2!5720 lt!199429))) (currentByte!5799 (_2!5720 lt!199429)) (currentBit!5794 (_2!5720 lt!199429))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2680 (buf!3038 thiss!1634)) (currentByte!5799 thiss!1634) (currentBit!5794 thiss!1634)))))))

(declare-fun b!128431 () Bool)

(declare-fun res!106285 () Bool)

(assert (=> b!128431 (=> (not res!106285) (not e!85134))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128431 (= res!106285 (invariant!0 (currentBit!5794 thiss!1634) (currentByte!5799 thiss!1634) (size!2680 (buf!3038 thiss!1634))))))

(declare-fun b!128432 () Bool)

(declare-fun res!106287 () Bool)

(assert (=> b!128432 (=> (not res!106287) (not e!85134))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128432 (= res!106287 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2680 (buf!3038 thiss!1634))) ((_ sign_extend 32) (currentByte!5799 thiss!1634)) ((_ sign_extend 32) (currentBit!5794 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128433 () Bool)

(declare-fun res!106289 () Bool)

(assert (=> b!128433 (=> (not res!106289) (not e!85134))))

(assert (=> b!128433 (= res!106289 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!10848 0))(
  ( (tuple2!10849 (_1!5721 BitStream!4624) (_2!5721 (_ BitVec 8))) )
))
(declare-fun lt!199430 () tuple2!10848)

(declare-fun b!128434 () Bool)

(declare-datatypes ((tuple2!10850 0))(
  ( (tuple2!10851 (_1!5722 BitStream!4624) (_2!5722 BitStream!4624)) )
))
(declare-fun lt!199428 () tuple2!10850)

(assert (=> b!128434 (= e!85132 (and (= (_2!5721 lt!199430) (select (arr!3297 arr!237) from!447)) (= (_1!5721 lt!199430) (_2!5722 lt!199428))))))

(declare-fun readBytePure!0 (BitStream!4624) tuple2!10848)

(assert (=> b!128434 (= lt!199430 (readBytePure!0 (_1!5722 lt!199428)))))

(declare-fun reader!0 (BitStream!4624 BitStream!4624) tuple2!10850)

(assert (=> b!128434 (= lt!199428 (reader!0 thiss!1634 (_2!5720 lt!199429)))))

(declare-fun b!128435 () Bool)

(assert (=> b!128435 (= e!85136 (array_inv!2469 (buf!3038 thiss!1634)))))

(assert (= (and start!25444 res!106291) b!128432))

(assert (= (and b!128432 res!106287) b!128433))

(assert (= (and b!128433 res!106289) b!128431))

(assert (= (and b!128431 res!106285) b!128429))

(assert (= (and b!128429 res!106290) b!128430))

(assert (= (and b!128430 res!106288) b!128428))

(assert (= (and b!128428 res!106286) b!128434))

(assert (= start!25444 b!128435))

(declare-fun m!194221 () Bool)

(assert (=> b!128435 m!194221))

(declare-fun m!194223 () Bool)

(assert (=> b!128430 m!194223))

(declare-fun m!194225 () Bool)

(assert (=> b!128430 m!194225))

(declare-fun m!194227 () Bool)

(assert (=> b!128431 m!194227))

(declare-fun m!194229 () Bool)

(assert (=> start!25444 m!194229))

(declare-fun m!194231 () Bool)

(assert (=> start!25444 m!194231))

(declare-fun m!194233 () Bool)

(assert (=> b!128429 m!194233))

(assert (=> b!128429 m!194233))

(declare-fun m!194235 () Bool)

(assert (=> b!128429 m!194235))

(declare-fun m!194237 () Bool)

(assert (=> b!128432 m!194237))

(assert (=> b!128434 m!194233))

(declare-fun m!194239 () Bool)

(assert (=> b!128434 m!194239))

(declare-fun m!194241 () Bool)

(assert (=> b!128434 m!194241))

(declare-fun m!194243 () Bool)

(assert (=> b!128428 m!194243))

(push 1)

(assert (not b!128434))

(assert (not start!25444))

(assert (not b!128431))

(assert (not b!128430))

(assert (not b!128428))

(assert (not b!128432))

(assert (not b!128435))

(assert (not b!128429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

