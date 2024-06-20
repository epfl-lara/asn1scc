; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15038 () Bool)

(assert start!15038)

(declare-fun b!76945 () Bool)

(declare-fun e!50470 () Bool)

(declare-datatypes ((array!3200 0))(
  ( (array!3201 (arr!2088 (Array (_ BitVec 32) (_ BitVec 8))) (size!1487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2548 0))(
  ( (BitStream!2549 (buf!1877 array!3200) (currentByte!3688 (_ BitVec 32)) (currentBit!3683 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2548)

(declare-fun array_inv!1333 (array!3200) Bool)

(assert (=> b!76945 (= e!50470 (array_inv!1333 (buf!1877 thiss!1090)))))

(declare-fun b!76946 () Bool)

(declare-fun e!50471 () Bool)

(declare-datatypes ((tuple2!6704 0))(
  ( (tuple2!6705 (_1!3486 BitStream!2548) (_2!3486 Bool)) )
))
(declare-fun lt!123327 () tuple2!6704)

(declare-datatypes ((tuple2!6706 0))(
  ( (tuple2!6707 (_1!3487 BitStream!2548) (_2!3487 BitStream!2548)) )
))
(declare-fun lt!123326 () tuple2!6706)

(assert (=> b!76946 (= e!50471 (not (or (not (_2!3486 lt!123327)) (not (= (_1!3486 lt!123327) (_2!3487 lt!123326))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2548 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6704)

(assert (=> b!76946 (= lt!123327 (checkBitsLoopPure!0 (_1!3487 lt!123326) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5065 0))(
  ( (Unit!5066) )
))
(declare-datatypes ((tuple2!6708 0))(
  ( (tuple2!6709 (_1!3488 Unit!5065) (_2!3488 BitStream!2548)) )
))
(declare-fun lt!123324 () tuple2!6708)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1487 (buf!1877 (_2!3488 lt!123324)))) ((_ sign_extend 32) (currentByte!3688 thiss!1090)) ((_ sign_extend 32) (currentBit!3683 thiss!1090)) nBits!322)))

(declare-fun lt!123325 () Unit!5065)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2548 array!3200 (_ BitVec 64)) Unit!5065)

(assert (=> b!76946 (= lt!123325 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1877 (_2!3488 lt!123324)) nBits!322))))

(declare-fun reader!0 (BitStream!2548 BitStream!2548) tuple2!6706)

(assert (=> b!76946 (= lt!123326 (reader!0 thiss!1090 (_2!3488 lt!123324)))))

(declare-fun res!63579 () Bool)

(declare-fun e!50469 () Bool)

(assert (=> start!15038 (=> (not res!63579) (not e!50469))))

(assert (=> start!15038 (= res!63579 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15038 e!50469))

(assert (=> start!15038 true))

(declare-fun inv!12 (BitStream!2548) Bool)

(assert (=> start!15038 (and (inv!12 thiss!1090) e!50470)))

(declare-fun b!76947 () Bool)

(declare-fun res!63576 () Bool)

(assert (=> b!76947 (=> (not res!63576) (not e!50469))))

(assert (=> b!76947 (= res!63576 (validate_offset_bits!1 ((_ sign_extend 32) (size!1487 (buf!1877 thiss!1090))) ((_ sign_extend 32) (currentByte!3688 thiss!1090)) ((_ sign_extend 32) (currentBit!3683 thiss!1090)) nBits!322))))

(declare-fun b!76948 () Bool)

(declare-fun res!63578 () Bool)

(assert (=> b!76948 (=> (not res!63578) (not e!50471))))

(declare-fun isPrefixOf!0 (BitStream!2548 BitStream!2548) Bool)

(assert (=> b!76948 (= res!63578 (isPrefixOf!0 thiss!1090 (_2!3488 lt!123324)))))

(declare-fun b!76949 () Bool)

(assert (=> b!76949 (= e!50469 (not true))))

(declare-fun lt!123330 () Bool)

(assert (=> b!76949 (= lt!123330 (isPrefixOf!0 thiss!1090 (_2!3488 lt!123324)))))

(declare-fun lt!123329 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76949 (= lt!123329 (bitIndex!0 (size!1487 (buf!1877 (_2!3488 lt!123324))) (currentByte!3688 (_2!3488 lt!123324)) (currentBit!3683 (_2!3488 lt!123324))))))

(declare-fun lt!123328 () (_ BitVec 64))

(assert (=> b!76949 (= lt!123328 (bitIndex!0 (size!1487 (buf!1877 thiss!1090)) (currentByte!3688 thiss!1090) (currentBit!3683 thiss!1090)))))

(assert (=> b!76949 e!50471))

(declare-fun res!63580 () Bool)

(assert (=> b!76949 (=> (not res!63580) (not e!50471))))

(assert (=> b!76949 (= res!63580 (= (size!1487 (buf!1877 thiss!1090)) (size!1487 (buf!1877 (_2!3488 lt!123324)))))))

(declare-fun appendNBits!0 (BitStream!2548 (_ BitVec 64) Bool) tuple2!6708)

(assert (=> b!76949 (= lt!123324 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76950 () Bool)

(declare-fun res!63577 () Bool)

(assert (=> b!76950 (=> (not res!63577) (not e!50471))))

(assert (=> b!76950 (= res!63577 (= (bitIndex!0 (size!1487 (buf!1877 (_2!3488 lt!123324))) (currentByte!3688 (_2!3488 lt!123324)) (currentBit!3683 (_2!3488 lt!123324))) (bvadd (bitIndex!0 (size!1487 (buf!1877 thiss!1090)) (currentByte!3688 thiss!1090) (currentBit!3683 thiss!1090)) nBits!322)))))

(assert (= (and start!15038 res!63579) b!76947))

(assert (= (and b!76947 res!63576) b!76949))

(assert (= (and b!76949 res!63580) b!76950))

(assert (= (and b!76950 res!63577) b!76948))

(assert (= (and b!76948 res!63578) b!76946))

(assert (= start!15038 b!76945))

(declare-fun m!122303 () Bool)

(assert (=> b!76946 m!122303))

(declare-fun m!122305 () Bool)

(assert (=> b!76946 m!122305))

(declare-fun m!122307 () Bool)

(assert (=> b!76946 m!122307))

(declare-fun m!122309 () Bool)

(assert (=> b!76946 m!122309))

(declare-fun m!122311 () Bool)

(assert (=> start!15038 m!122311))

(declare-fun m!122313 () Bool)

(assert (=> b!76947 m!122313))

(declare-fun m!122315 () Bool)

(assert (=> b!76945 m!122315))

(declare-fun m!122317 () Bool)

(assert (=> b!76949 m!122317))

(declare-fun m!122319 () Bool)

(assert (=> b!76949 m!122319))

(declare-fun m!122321 () Bool)

(assert (=> b!76949 m!122321))

(declare-fun m!122323 () Bool)

(assert (=> b!76949 m!122323))

(assert (=> b!76948 m!122317))

(assert (=> b!76950 m!122319))

(assert (=> b!76950 m!122321))

(push 1)

(assert (not start!15038))

(assert (not b!76947))

(assert (not b!76946))

(assert (not b!76949))

(assert (not b!76945))

(assert (not b!76948))

(assert (not b!76950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

