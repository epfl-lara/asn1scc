; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25670 () Bool)

(assert start!25670)

(declare-fun b!130837 () Bool)

(declare-fun e!86716 () Bool)

(declare-datatypes ((array!6050 0))(
  ( (array!6051 (arr!3362 (Array (_ BitVec 32) (_ BitVec 8))) (size!2739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4742 0))(
  ( (BitStream!4743 (buf!3100 array!6050) (currentByte!5873 (_ BitVec 32)) (currentBit!5868 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11276 0))(
  ( (tuple2!11277 (_1!5938 BitStream!4742) (_2!5938 (_ BitVec 8))) )
))
(declare-fun lt!201852 () tuple2!11276)

(declare-fun lt!201859 () tuple2!11276)

(assert (=> b!130837 (= e!86716 (= (_2!5938 lt!201852) (_2!5938 lt!201859)))))

(declare-fun b!130838 () Bool)

(declare-fun e!86722 () Bool)

(declare-fun e!86720 () Bool)

(assert (=> b!130838 (= e!86722 e!86720)))

(declare-fun res!108497 () Bool)

(assert (=> b!130838 (=> (not res!108497) (not e!86720))))

(declare-datatypes ((Unit!8092 0))(
  ( (Unit!8093) )
))
(declare-datatypes ((tuple2!11278 0))(
  ( (tuple2!11279 (_1!5939 Unit!8092) (_2!5939 BitStream!4742)) )
))
(declare-fun lt!201850 () tuple2!11278)

(declare-fun lt!201858 () tuple2!11278)

(declare-fun lt!201860 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130838 (= res!108497 (= (bitIndex!0 (size!2739 (buf!3100 (_2!5939 lt!201850))) (currentByte!5873 (_2!5939 lt!201850)) (currentBit!5868 (_2!5939 lt!201850))) (bvadd (bitIndex!0 (size!2739 (buf!3100 (_2!5939 lt!201858))) (currentByte!5873 (_2!5939 lt!201858)) (currentBit!5868 (_2!5939 lt!201858))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201860))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!130838 (= lt!201860 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!108496 () Bool)

(declare-fun e!86717 () Bool)

(assert (=> start!25670 (=> (not res!108496) (not e!86717))))

(declare-fun arr!237 () array!6050)

(assert (=> start!25670 (= res!108496 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2739 arr!237))))))

(assert (=> start!25670 e!86717))

(assert (=> start!25670 true))

(declare-fun array_inv!2528 (array!6050) Bool)

(assert (=> start!25670 (array_inv!2528 arr!237)))

(declare-fun thiss!1634 () BitStream!4742)

(declare-fun e!86718 () Bool)

(declare-fun inv!12 (BitStream!4742) Bool)

(assert (=> start!25670 (and (inv!12 thiss!1634) e!86718)))

(declare-fun b!130839 () Bool)

(declare-fun res!108492 () Bool)

(assert (=> b!130839 (=> (not res!108492) (not e!86720))))

(declare-fun isPrefixOf!0 (BitStream!4742 BitStream!4742) Bool)

(assert (=> b!130839 (= res!108492 (isPrefixOf!0 (_2!5939 lt!201858) (_2!5939 lt!201850)))))

(declare-fun b!130840 () Bool)

(assert (=> b!130840 (= e!86718 (array_inv!2528 (buf!3100 thiss!1634)))))

(declare-fun b!130841 () Bool)

(declare-fun res!108490 () Bool)

(assert (=> b!130841 (=> (not res!108490) (not e!86717))))

(assert (=> b!130841 (= res!108490 (bvslt from!447 to!404))))

(declare-fun b!130842 () Bool)

(declare-fun e!86723 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130842 (= e!86723 (invariant!0 (currentBit!5868 thiss!1634) (currentByte!5873 thiss!1634) (size!2739 (buf!3100 (_2!5939 lt!201858)))))))

(declare-fun b!130843 () Bool)

(declare-fun res!108489 () Bool)

(assert (=> b!130843 (=> (not res!108489) (not e!86717))))

(assert (=> b!130843 (= res!108489 (invariant!0 (currentBit!5868 thiss!1634) (currentByte!5873 thiss!1634) (size!2739 (buf!3100 thiss!1634))))))

(declare-fun b!130844 () Bool)

(declare-fun e!86715 () Bool)

(assert (=> b!130844 (= e!86720 (not e!86715))))

(declare-fun res!108488 () Bool)

(assert (=> b!130844 (=> res!108488 e!86715)))

(declare-datatypes ((tuple2!11280 0))(
  ( (tuple2!11281 (_1!5940 BitStream!4742) (_2!5940 BitStream!4742)) )
))
(declare-fun lt!201847 () tuple2!11280)

(declare-datatypes ((tuple2!11282 0))(
  ( (tuple2!11283 (_1!5941 BitStream!4742) (_2!5941 array!6050)) )
))
(declare-fun lt!201855 () tuple2!11282)

(assert (=> b!130844 (= res!108488 (or (not (= (size!2739 (_2!5941 lt!201855)) (size!2739 arr!237))) (not (= (_1!5941 lt!201855) (_2!5940 lt!201847)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4742 array!6050 (_ BitVec 32) (_ BitVec 32)) tuple2!11282)

(assert (=> b!130844 (= lt!201855 (readByteArrayLoopPure!0 (_1!5940 lt!201847) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130844 (validate_offset_bits!1 ((_ sign_extend 32) (size!2739 (buf!3100 (_2!5939 lt!201850)))) ((_ sign_extend 32) (currentByte!5873 (_2!5939 lt!201858))) ((_ sign_extend 32) (currentBit!5868 (_2!5939 lt!201858))) lt!201860)))

(declare-fun lt!201857 () Unit!8092)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4742 array!6050 (_ BitVec 64)) Unit!8092)

(assert (=> b!130844 (= lt!201857 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5939 lt!201858) (buf!3100 (_2!5939 lt!201850)) lt!201860))))

(declare-fun reader!0 (BitStream!4742 BitStream!4742) tuple2!11280)

(assert (=> b!130844 (= lt!201847 (reader!0 (_2!5939 lt!201858) (_2!5939 lt!201850)))))

(declare-fun b!130845 () Bool)

(declare-fun res!108487 () Bool)

(assert (=> b!130845 (=> (not res!108487) (not e!86717))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130845 (= res!108487 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2739 (buf!3100 thiss!1634))) ((_ sign_extend 32) (currentByte!5873 thiss!1634)) ((_ sign_extend 32) (currentBit!5868 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130846 () Bool)

(assert (=> b!130846 (= e!86717 (not true))))

(declare-fun lt!201854 () tuple2!11280)

(declare-fun readBytePure!0 (BitStream!4742) tuple2!11276)

(assert (=> b!130846 (= (_2!5938 (readBytePure!0 (_1!5940 lt!201854))) (select (arr!3362 arr!237) from!447))))

(declare-fun lt!201845 () tuple2!11280)

(assert (=> b!130846 (= lt!201845 (reader!0 (_2!5939 lt!201858) (_2!5939 lt!201850)))))

(assert (=> b!130846 (= lt!201854 (reader!0 thiss!1634 (_2!5939 lt!201850)))))

(assert (=> b!130846 e!86716))

(declare-fun res!108494 () Bool)

(assert (=> b!130846 (=> (not res!108494) (not e!86716))))

(assert (=> b!130846 (= res!108494 (= (bitIndex!0 (size!2739 (buf!3100 (_1!5938 lt!201852))) (currentByte!5873 (_1!5938 lt!201852)) (currentBit!5868 (_1!5938 lt!201852))) (bitIndex!0 (size!2739 (buf!3100 (_1!5938 lt!201859))) (currentByte!5873 (_1!5938 lt!201859)) (currentBit!5868 (_1!5938 lt!201859)))))))

(declare-fun lt!201856 () Unit!8092)

(declare-fun lt!201849 () BitStream!4742)

(declare-fun readBytePrefixLemma!0 (BitStream!4742 BitStream!4742) Unit!8092)

(assert (=> b!130846 (= lt!201856 (readBytePrefixLemma!0 lt!201849 (_2!5939 lt!201850)))))

(assert (=> b!130846 (= lt!201859 (readBytePure!0 (BitStream!4743 (buf!3100 (_2!5939 lt!201850)) (currentByte!5873 thiss!1634) (currentBit!5868 thiss!1634))))))

(assert (=> b!130846 (= lt!201852 (readBytePure!0 lt!201849))))

(assert (=> b!130846 (= lt!201849 (BitStream!4743 (buf!3100 (_2!5939 lt!201858)) (currentByte!5873 thiss!1634) (currentBit!5868 thiss!1634)))))

(assert (=> b!130846 e!86723))

(declare-fun res!108491 () Bool)

(assert (=> b!130846 (=> (not res!108491) (not e!86723))))

(assert (=> b!130846 (= res!108491 (isPrefixOf!0 thiss!1634 (_2!5939 lt!201850)))))

(declare-fun lt!201853 () Unit!8092)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4742 BitStream!4742 BitStream!4742) Unit!8092)

(assert (=> b!130846 (= lt!201853 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5939 lt!201858) (_2!5939 lt!201850)))))

(assert (=> b!130846 e!86722))

(declare-fun res!108495 () Bool)

(assert (=> b!130846 (=> (not res!108495) (not e!86722))))

(assert (=> b!130846 (= res!108495 (= (size!2739 (buf!3100 (_2!5939 lt!201858))) (size!2739 (buf!3100 (_2!5939 lt!201850)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4742 array!6050 (_ BitVec 32) (_ BitVec 32)) tuple2!11278)

(assert (=> b!130846 (= lt!201850 (appendByteArrayLoop!0 (_2!5939 lt!201858) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130846 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2739 (buf!3100 (_2!5939 lt!201858)))) ((_ sign_extend 32) (currentByte!5873 (_2!5939 lt!201858))) ((_ sign_extend 32) (currentBit!5868 (_2!5939 lt!201858))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201846 () Unit!8092)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4742 BitStream!4742 (_ BitVec 64) (_ BitVec 32)) Unit!8092)

(assert (=> b!130846 (= lt!201846 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5939 lt!201858) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!86721 () Bool)

(assert (=> b!130846 e!86721))

(declare-fun res!108498 () Bool)

(assert (=> b!130846 (=> (not res!108498) (not e!86721))))

(assert (=> b!130846 (= res!108498 (= (size!2739 (buf!3100 thiss!1634)) (size!2739 (buf!3100 (_2!5939 lt!201858)))))))

(declare-fun appendByte!0 (BitStream!4742 (_ BitVec 8)) tuple2!11278)

(assert (=> b!130846 (= lt!201858 (appendByte!0 thiss!1634 (select (arr!3362 arr!237) from!447)))))

(declare-fun lt!201848 () tuple2!11276)

(declare-fun b!130847 () Bool)

(declare-fun lt!201851 () tuple2!11280)

(assert (=> b!130847 (= e!86721 (and (= (_2!5938 lt!201848) (select (arr!3362 arr!237) from!447)) (= (_1!5938 lt!201848) (_2!5940 lt!201851))))))

(assert (=> b!130847 (= lt!201848 (readBytePure!0 (_1!5940 lt!201851)))))

(assert (=> b!130847 (= lt!201851 (reader!0 thiss!1634 (_2!5939 lt!201858)))))

(declare-fun b!130848 () Bool)

(declare-fun res!108499 () Bool)

(assert (=> b!130848 (=> (not res!108499) (not e!86721))))

(assert (=> b!130848 (= res!108499 (isPrefixOf!0 thiss!1634 (_2!5939 lt!201858)))))

(declare-fun b!130849 () Bool)

(declare-fun arrayRangesEq!142 (array!6050 array!6050 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130849 (= e!86715 (not (arrayRangesEq!142 arr!237 (_2!5941 lt!201855) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130850 () Bool)

(declare-fun res!108493 () Bool)

(assert (=> b!130850 (=> (not res!108493) (not e!86721))))

(assert (=> b!130850 (= res!108493 (= (bitIndex!0 (size!2739 (buf!3100 (_2!5939 lt!201858))) (currentByte!5873 (_2!5939 lt!201858)) (currentBit!5868 (_2!5939 lt!201858))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2739 (buf!3100 thiss!1634)) (currentByte!5873 thiss!1634) (currentBit!5868 thiss!1634)))))))

(assert (= (and start!25670 res!108496) b!130845))

(assert (= (and b!130845 res!108487) b!130841))

(assert (= (and b!130841 res!108490) b!130843))

(assert (= (and b!130843 res!108489) b!130846))

(assert (= (and b!130846 res!108498) b!130850))

(assert (= (and b!130850 res!108493) b!130848))

(assert (= (and b!130848 res!108499) b!130847))

(assert (= (and b!130846 res!108495) b!130838))

(assert (= (and b!130838 res!108497) b!130839))

(assert (= (and b!130839 res!108492) b!130844))

(assert (= (and b!130844 (not res!108488)) b!130849))

(assert (= (and b!130846 res!108491) b!130842))

(assert (= (and b!130846 res!108494) b!130837))

(assert (= start!25670 b!130840))

(declare-fun m!197349 () Bool)

(assert (=> b!130848 m!197349))

(declare-fun m!197351 () Bool)

(assert (=> b!130849 m!197351))

(declare-fun m!197353 () Bool)

(assert (=> b!130847 m!197353))

(declare-fun m!197355 () Bool)

(assert (=> b!130847 m!197355))

(declare-fun m!197357 () Bool)

(assert (=> b!130847 m!197357))

(declare-fun m!197359 () Bool)

(assert (=> b!130845 m!197359))

(declare-fun m!197361 () Bool)

(assert (=> b!130840 m!197361))

(declare-fun m!197363 () Bool)

(assert (=> b!130850 m!197363))

(declare-fun m!197365 () Bool)

(assert (=> b!130850 m!197365))

(declare-fun m!197367 () Bool)

(assert (=> b!130846 m!197367))

(declare-fun m!197369 () Bool)

(assert (=> b!130846 m!197369))

(declare-fun m!197371 () Bool)

(assert (=> b!130846 m!197371))

(declare-fun m!197373 () Bool)

(assert (=> b!130846 m!197373))

(declare-fun m!197375 () Bool)

(assert (=> b!130846 m!197375))

(declare-fun m!197377 () Bool)

(assert (=> b!130846 m!197377))

(declare-fun m!197379 () Bool)

(assert (=> b!130846 m!197379))

(assert (=> b!130846 m!197353))

(declare-fun m!197381 () Bool)

(assert (=> b!130846 m!197381))

(assert (=> b!130846 m!197353))

(declare-fun m!197383 () Bool)

(assert (=> b!130846 m!197383))

(declare-fun m!197385 () Bool)

(assert (=> b!130846 m!197385))

(declare-fun m!197387 () Bool)

(assert (=> b!130846 m!197387))

(declare-fun m!197389 () Bool)

(assert (=> b!130846 m!197389))

(declare-fun m!197391 () Bool)

(assert (=> b!130846 m!197391))

(declare-fun m!197393 () Bool)

(assert (=> b!130846 m!197393))

(declare-fun m!197395 () Bool)

(assert (=> b!130838 m!197395))

(assert (=> b!130838 m!197363))

(declare-fun m!197397 () Bool)

(assert (=> b!130842 m!197397))

(declare-fun m!197399 () Bool)

(assert (=> b!130844 m!197399))

(declare-fun m!197401 () Bool)

(assert (=> b!130844 m!197401))

(declare-fun m!197403 () Bool)

(assert (=> b!130844 m!197403))

(assert (=> b!130844 m!197375))

(declare-fun m!197405 () Bool)

(assert (=> b!130839 m!197405))

(declare-fun m!197407 () Bool)

(assert (=> b!130843 m!197407))

(declare-fun m!197409 () Bool)

(assert (=> start!25670 m!197409))

(declare-fun m!197411 () Bool)

(assert (=> start!25670 m!197411))

(push 1)

(assert (not b!130842))

(assert (not b!130844))

(assert (not start!25670))

(assert (not b!130838))

(assert (not b!130849))

(assert (not b!130839))

(assert (not b!130843))

(assert (not b!130850))

(assert (not b!130847))

(assert (not b!130848))

(assert (not b!130846))

(assert (not b!130840))

(assert (not b!130845))

(check-sat)

