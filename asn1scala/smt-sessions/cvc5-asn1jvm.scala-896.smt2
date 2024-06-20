; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25450 () Bool)

(assert start!25450)

(declare-fun b!128502 () Bool)

(declare-datatypes ((array!5935 0))(
  ( (array!5936 (arr!3300 (Array (_ BitVec 32) (_ BitVec 8))) (size!2683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4630 0))(
  ( (BitStream!4631 (buf!3041 array!5935) (currentByte!5802 (_ BitVec 32)) (currentBit!5797 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10864 0))(
  ( (tuple2!10865 (_1!5729 BitStream!4630) (_2!5729 BitStream!4630)) )
))
(declare-fun lt!199459 () tuple2!10864)

(declare-fun e!85183 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!10866 0))(
  ( (tuple2!10867 (_1!5730 BitStream!4630) (_2!5730 (_ BitVec 8))) )
))
(declare-fun lt!199457 () tuple2!10866)

(declare-fun arr!237 () array!5935)

(assert (=> b!128502 (= e!85183 (and (= (_2!5730 lt!199457) (select (arr!3300 arr!237) from!447)) (= (_1!5730 lt!199457) (_2!5729 lt!199459))))))

(declare-fun readBytePure!0 (BitStream!4630) tuple2!10866)

(assert (=> b!128502 (= lt!199457 (readBytePure!0 (_1!5729 lt!199459)))))

(declare-fun thiss!1634 () BitStream!4630)

(declare-datatypes ((Unit!7971 0))(
  ( (Unit!7972) )
))
(declare-datatypes ((tuple2!10868 0))(
  ( (tuple2!10869 (_1!5731 Unit!7971) (_2!5731 BitStream!4630)) )
))
(declare-fun lt!199460 () tuple2!10868)

(declare-fun reader!0 (BitStream!4630 BitStream!4630) tuple2!10864)

(assert (=> b!128502 (= lt!199459 (reader!0 thiss!1634 (_2!5731 lt!199460)))))

(declare-fun b!128503 () Bool)

(declare-fun e!85181 () Bool)

(declare-fun array_inv!2472 (array!5935) Bool)

(assert (=> b!128503 (= e!85181 (array_inv!2472 (buf!3041 thiss!1634)))))

(declare-fun b!128504 () Bool)

(declare-fun res!106353 () Bool)

(assert (=> b!128504 (=> (not res!106353) (not e!85183))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128504 (= res!106353 (= (bitIndex!0 (size!2683 (buf!3041 (_2!5731 lt!199460))) (currentByte!5802 (_2!5731 lt!199460)) (currentBit!5797 (_2!5731 lt!199460))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2683 (buf!3041 thiss!1634)) (currentByte!5802 thiss!1634) (currentBit!5797 thiss!1634)))))))

(declare-fun b!128505 () Bool)

(declare-fun e!85179 () Bool)

(declare-fun e!85184 () Bool)

(assert (=> b!128505 (= e!85179 (not e!85184))))

(declare-fun res!106354 () Bool)

(assert (=> b!128505 (=> res!106354 e!85184)))

(assert (=> b!128505 (= res!106354 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2683 (buf!3041 (_2!5731 lt!199460))) (currentByte!5802 (_2!5731 lt!199460)) (currentBit!5797 (_2!5731 lt!199460)))))))

(assert (=> b!128505 e!85183))

(declare-fun res!106350 () Bool)

(assert (=> b!128505 (=> (not res!106350) (not e!85183))))

(assert (=> b!128505 (= res!106350 (= (size!2683 (buf!3041 thiss!1634)) (size!2683 (buf!3041 (_2!5731 lt!199460)))))))

(declare-fun appendByte!0 (BitStream!4630 (_ BitVec 8)) tuple2!10868)

(assert (=> b!128505 (= lt!199460 (appendByte!0 thiss!1634 (select (arr!3300 arr!237) from!447)))))

(declare-fun b!128506 () Bool)

(declare-fun res!106355 () Bool)

(assert (=> b!128506 (=> (not res!106355) (not e!85183))))

(declare-fun isPrefixOf!0 (BitStream!4630 BitStream!4630) Bool)

(assert (=> b!128506 (= res!106355 (isPrefixOf!0 thiss!1634 (_2!5731 lt!199460)))))

(declare-fun b!128507 () Bool)

(declare-fun res!106352 () Bool)

(assert (=> b!128507 (=> (not res!106352) (not e!85179))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128507 (= res!106352 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2683 (buf!3041 thiss!1634))) ((_ sign_extend 32) (currentByte!5802 thiss!1634)) ((_ sign_extend 32) (currentBit!5797 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128508 () Bool)

(declare-fun res!106357 () Bool)

(assert (=> b!128508 (=> (not res!106357) (not e!85179))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128508 (= res!106357 (invariant!0 (currentBit!5797 thiss!1634) (currentByte!5802 thiss!1634) (size!2683 (buf!3041 thiss!1634))))))

(declare-fun b!128509 () Bool)

(declare-fun res!106356 () Bool)

(assert (=> b!128509 (=> (not res!106356) (not e!85179))))

(assert (=> b!128509 (= res!106356 (bvslt from!447 to!404))))

(declare-fun b!128510 () Bool)

(assert (=> b!128510 (= e!85184 true)))

(declare-fun lt!199458 () (_ BitVec 64))

(assert (=> b!128510 (= lt!199458 (bitIndex!0 (size!2683 (buf!3041 thiss!1634)) (currentByte!5802 thiss!1634) (currentBit!5797 thiss!1634)))))

(declare-fun res!106351 () Bool)

(assert (=> start!25450 (=> (not res!106351) (not e!85179))))

(assert (=> start!25450 (= res!106351 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2683 arr!237))))))

(assert (=> start!25450 e!85179))

(assert (=> start!25450 true))

(assert (=> start!25450 (array_inv!2472 arr!237)))

(declare-fun inv!12 (BitStream!4630) Bool)

(assert (=> start!25450 (and (inv!12 thiss!1634) e!85181)))

(assert (= (and start!25450 res!106351) b!128507))

(assert (= (and b!128507 res!106352) b!128509))

(assert (= (and b!128509 res!106356) b!128508))

(assert (= (and b!128508 res!106357) b!128505))

(assert (= (and b!128505 res!106350) b!128504))

(assert (= (and b!128504 res!106353) b!128506))

(assert (= (and b!128506 res!106355) b!128502))

(assert (= (and b!128505 (not res!106354)) b!128510))

(assert (= start!25450 b!128503))

(declare-fun m!194293 () Bool)

(assert (=> b!128504 m!194293))

(declare-fun m!194295 () Bool)

(assert (=> b!128504 m!194295))

(declare-fun m!194297 () Bool)

(assert (=> b!128508 m!194297))

(declare-fun m!194299 () Bool)

(assert (=> b!128506 m!194299))

(declare-fun m!194301 () Bool)

(assert (=> b!128502 m!194301))

(declare-fun m!194303 () Bool)

(assert (=> b!128502 m!194303))

(declare-fun m!194305 () Bool)

(assert (=> b!128502 m!194305))

(declare-fun m!194307 () Bool)

(assert (=> start!25450 m!194307))

(declare-fun m!194309 () Bool)

(assert (=> start!25450 m!194309))

(declare-fun m!194311 () Bool)

(assert (=> b!128507 m!194311))

(declare-fun m!194313 () Bool)

(assert (=> b!128503 m!194313))

(assert (=> b!128505 m!194293))

(assert (=> b!128505 m!194301))

(assert (=> b!128505 m!194301))

(declare-fun m!194315 () Bool)

(assert (=> b!128505 m!194315))

(assert (=> b!128510 m!194295))

(push 1)

(assert (not start!25450))

(assert (not b!128508))

(assert (not b!128504))

(assert (not b!128510))

(assert (not b!128505))

(assert (not b!128507))

(assert (not b!128502))

(assert (not b!128503))

(assert (not b!128506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

