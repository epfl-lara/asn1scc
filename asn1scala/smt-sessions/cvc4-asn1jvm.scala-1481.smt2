; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40998 () Bool)

(assert start!40998)

(declare-fun b!189526 () Bool)

(declare-fun e!130854 () Bool)

(declare-fun e!130852 () Bool)

(assert (=> b!189526 (= e!130854 e!130852)))

(declare-fun res!158021 () Bool)

(assert (=> b!189526 (=> (not res!158021) (not e!130852))))

(declare-datatypes ((array!9888 0))(
  ( (array!9889 (arr!5289 (Array (_ BitVec 32) (_ BitVec 8))) (size!4359 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7826 0))(
  ( (BitStream!7827 (buf!4833 array!9888) (currentByte!9105 (_ BitVec 32)) (currentBit!9100 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7826)

(declare-fun lt!294279 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189526 (= res!158021 (validate_offset_bits!1 ((_ sign_extend 32) (size!4359 (buf!4833 thiss!1204))) ((_ sign_extend 32) (currentByte!9105 thiss!1204)) ((_ sign_extend 32) (currentBit!9100 thiss!1204)) lt!294279))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!189526 (= lt!294279 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189527 () Bool)

(declare-fun res!158012 () Bool)

(declare-fun e!130847 () Bool)

(assert (=> b!189527 (=> res!158012 e!130847)))

(declare-fun lt!294292 () (_ BitVec 64))

(declare-fun lt!294270 () (_ BitVec 64))

(declare-datatypes ((Unit!13517 0))(
  ( (Unit!13518) )
))
(declare-datatypes ((tuple2!16380 0))(
  ( (tuple2!16381 (_1!8835 Unit!13517) (_2!8835 BitStream!7826)) )
))
(declare-fun lt!294269 () tuple2!16380)

(assert (=> b!189527 (= res!158012 (or (not (= (size!4359 (buf!4833 (_2!8835 lt!294269))) (size!4359 (buf!4833 thiss!1204)))) (not (= lt!294270 (bvsub (bvadd lt!294292 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189528 () Bool)

(declare-fun e!130853 () Bool)

(assert (=> b!189528 (= e!130852 (not e!130853))))

(declare-fun res!158011 () Bool)

(assert (=> b!189528 (=> res!158011 e!130853)))

(declare-fun lt!294273 () (_ BitVec 64))

(assert (=> b!189528 (= res!158011 (not (= lt!294273 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294292))))))

(declare-fun lt!294283 () tuple2!16380)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189528 (= lt!294273 (bitIndex!0 (size!4359 (buf!4833 (_2!8835 lt!294283))) (currentByte!9105 (_2!8835 lt!294283)) (currentBit!9100 (_2!8835 lt!294283))))))

(assert (=> b!189528 (= lt!294292 (bitIndex!0 (size!4359 (buf!4833 thiss!1204)) (currentByte!9105 thiss!1204) (currentBit!9100 thiss!1204)))))

(declare-fun e!130855 () Bool)

(assert (=> b!189528 e!130855))

(declare-fun res!158017 () Bool)

(assert (=> b!189528 (=> (not res!158017) (not e!130855))))

(assert (=> b!189528 (= res!158017 (= (size!4359 (buf!4833 thiss!1204)) (size!4359 (buf!4833 (_2!8835 lt!294283)))))))

(declare-fun lt!294285 () Bool)

(declare-fun appendBit!0 (BitStream!7826 Bool) tuple2!16380)

(assert (=> b!189528 (= lt!294283 (appendBit!0 thiss!1204 lt!294285))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!294278 () (_ BitVec 64))

(assert (=> b!189528 (= lt!294285 (not (= (bvand v!189 lt!294278) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189528 (= lt!294278 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189529 () Bool)

(declare-fun lt!294286 () BitStream!7826)

(declare-datatypes ((tuple2!16382 0))(
  ( (tuple2!16383 (_1!8836 BitStream!7826) (_2!8836 BitStream!7826)) )
))
(declare-fun lt!294277 () tuple2!16382)

(declare-datatypes ((tuple2!16384 0))(
  ( (tuple2!16385 (_1!8837 BitStream!7826) (_2!8837 (_ BitVec 64))) )
))
(declare-fun lt!294291 () tuple2!16384)

(declare-fun e!130848 () Bool)

(declare-fun lt!294295 () tuple2!16384)

(assert (=> b!189529 (= e!130848 (and (= lt!294292 (bvsub lt!294273 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8836 lt!294277) lt!294286)) (= (_2!8837 lt!294295) (_2!8837 lt!294291)))))))

(declare-fun b!189530 () Bool)

(declare-fun e!130856 () Bool)

(declare-datatypes ((tuple2!16386 0))(
  ( (tuple2!16387 (_1!8838 BitStream!7826) (_2!8838 Bool)) )
))
(declare-fun lt!294294 () tuple2!16386)

(declare-fun lt!294293 () tuple2!16386)

(assert (=> b!189530 (= e!130856 (= (_2!8838 lt!294294) (_2!8838 lt!294293)))))

(declare-fun b!189531 () Bool)

(assert (=> b!189531 (= e!130853 e!130847)))

(declare-fun res!158026 () Bool)

(assert (=> b!189531 (=> res!158026 e!130847)))

(assert (=> b!189531 (= res!158026 (not (= lt!294270 (bvsub (bvsub (bvadd lt!294273 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!189531 (= lt!294270 (bitIndex!0 (size!4359 (buf!4833 (_2!8835 lt!294269))) (currentByte!9105 (_2!8835 lt!294269)) (currentBit!9100 (_2!8835 lt!294269))))))

(declare-fun isPrefixOf!0 (BitStream!7826 BitStream!7826) Bool)

(assert (=> b!189531 (isPrefixOf!0 thiss!1204 (_2!8835 lt!294269))))

(declare-fun lt!294289 () Unit!13517)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7826 BitStream!7826 BitStream!7826) Unit!13517)

(assert (=> b!189531 (= lt!294289 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8835 lt!294283) (_2!8835 lt!294269)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7826 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16380)

(assert (=> b!189531 (= lt!294269 (appendBitsLSBFirstLoopTR!0 (_2!8835 lt!294283) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189532 () Bool)

(declare-fun e!130851 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189532 (= e!130851 (invariant!0 (currentBit!9100 thiss!1204) (currentByte!9105 thiss!1204) (size!4359 (buf!4833 (_2!8835 lt!294269)))))))

(declare-fun res!158023 () Bool)

(assert (=> start!40998 (=> (not res!158023) (not e!130854))))

(assert (=> start!40998 (= res!158023 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40998 e!130854))

(assert (=> start!40998 true))

(declare-fun e!130858 () Bool)

(declare-fun inv!12 (BitStream!7826) Bool)

(assert (=> start!40998 (and (inv!12 thiss!1204) e!130858)))

(declare-fun b!189533 () Bool)

(declare-fun e!130857 () Bool)

(assert (=> b!189533 (= e!130847 e!130857)))

(declare-fun res!158010 () Bool)

(assert (=> b!189533 (=> res!158010 e!130857)))

(assert (=> b!189533 (= res!158010 (not (= (_1!8837 lt!294291) (_2!8836 lt!294277))))))

(declare-fun lt!294275 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16384)

(assert (=> b!189533 (= lt!294291 (readNBitsLSBFirstsLoopPure!0 (_1!8836 lt!294277) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294275))))

(declare-fun lt!294288 () (_ BitVec 64))

(assert (=> b!189533 (validate_offset_bits!1 ((_ sign_extend 32) (size!4359 (buf!4833 (_2!8835 lt!294269)))) ((_ sign_extend 32) (currentByte!9105 (_2!8835 lt!294283))) ((_ sign_extend 32) (currentBit!9100 (_2!8835 lt!294283))) lt!294288)))

(declare-fun lt!294287 () Unit!13517)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7826 array!9888 (_ BitVec 64)) Unit!13517)

(assert (=> b!189533 (= lt!294287 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8835 lt!294283) (buf!4833 (_2!8835 lt!294269)) lt!294288))))

(assert (=> b!189533 (= lt!294288 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!294271 () tuple2!16386)

(declare-fun lt!294267 () (_ BitVec 64))

(assert (=> b!189533 (= lt!294275 (bvor lt!294267 (ite (_2!8838 lt!294271) lt!294278 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!294276 () tuple2!16382)

(assert (=> b!189533 (= lt!294295 (readNBitsLSBFirstsLoopPure!0 (_1!8836 lt!294276) nBits!348 i!590 lt!294267))))

(assert (=> b!189533 (validate_offset_bits!1 ((_ sign_extend 32) (size!4359 (buf!4833 (_2!8835 lt!294269)))) ((_ sign_extend 32) (currentByte!9105 thiss!1204)) ((_ sign_extend 32) (currentBit!9100 thiss!1204)) lt!294279)))

(declare-fun lt!294274 () Unit!13517)

(assert (=> b!189533 (= lt!294274 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4833 (_2!8835 lt!294269)) lt!294279))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189533 (= lt!294267 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!189533 (= (_2!8838 lt!294271) lt!294285)))

(declare-fun readBitPure!0 (BitStream!7826) tuple2!16386)

(assert (=> b!189533 (= lt!294271 (readBitPure!0 (_1!8836 lt!294276)))))

(declare-fun reader!0 (BitStream!7826 BitStream!7826) tuple2!16382)

(assert (=> b!189533 (= lt!294277 (reader!0 (_2!8835 lt!294283) (_2!8835 lt!294269)))))

(assert (=> b!189533 (= lt!294276 (reader!0 thiss!1204 (_2!8835 lt!294269)))))

(assert (=> b!189533 e!130856))

(declare-fun res!158020 () Bool)

(assert (=> b!189533 (=> (not res!158020) (not e!130856))))

(assert (=> b!189533 (= res!158020 (= (bitIndex!0 (size!4359 (buf!4833 (_1!8838 lt!294294))) (currentByte!9105 (_1!8838 lt!294294)) (currentBit!9100 (_1!8838 lt!294294))) (bitIndex!0 (size!4359 (buf!4833 (_1!8838 lt!294293))) (currentByte!9105 (_1!8838 lt!294293)) (currentBit!9100 (_1!8838 lt!294293)))))))

(declare-fun lt!294290 () Unit!13517)

(declare-fun lt!294272 () BitStream!7826)

(declare-fun readBitPrefixLemma!0 (BitStream!7826 BitStream!7826) Unit!13517)

(assert (=> b!189533 (= lt!294290 (readBitPrefixLemma!0 lt!294272 (_2!8835 lt!294269)))))

(assert (=> b!189533 (= lt!294293 (readBitPure!0 (BitStream!7827 (buf!4833 (_2!8835 lt!294269)) (currentByte!9105 thiss!1204) (currentBit!9100 thiss!1204))))))

(assert (=> b!189533 (= lt!294294 (readBitPure!0 lt!294272))))

(assert (=> b!189533 e!130851))

(declare-fun res!158018 () Bool)

(assert (=> b!189533 (=> (not res!158018) (not e!130851))))

(assert (=> b!189533 (= res!158018 (invariant!0 (currentBit!9100 thiss!1204) (currentByte!9105 thiss!1204) (size!4359 (buf!4833 (_2!8835 lt!294283)))))))

(assert (=> b!189533 (= lt!294272 (BitStream!7827 (buf!4833 (_2!8835 lt!294283)) (currentByte!9105 thiss!1204) (currentBit!9100 thiss!1204)))))

(declare-fun b!189534 () Bool)

(declare-fun res!158027 () Bool)

(assert (=> b!189534 (=> (not res!158027) (not e!130852))))

(assert (=> b!189534 (= res!158027 (not (= i!590 nBits!348)))))

(declare-fun b!189535 () Bool)

(declare-fun res!158024 () Bool)

(assert (=> b!189535 (=> (not res!158024) (not e!130852))))

(assert (=> b!189535 (= res!158024 (invariant!0 (currentBit!9100 thiss!1204) (currentByte!9105 thiss!1204) (size!4359 (buf!4833 thiss!1204))))))

(declare-fun b!189536 () Bool)

(declare-fun res!158014 () Bool)

(assert (=> b!189536 (=> (not res!158014) (not e!130848))))

(declare-fun withMovedBitIndex!0 (BitStream!7826 (_ BitVec 64)) BitStream!7826)

(assert (=> b!189536 (= res!158014 (= (_1!8836 lt!294277) (withMovedBitIndex!0 (_2!8836 lt!294277) (bvsub lt!294273 lt!294270))))))

(declare-fun b!189537 () Bool)

(declare-fun e!130859 () Bool)

(declare-fun e!130850 () Bool)

(assert (=> b!189537 (= e!130859 e!130850)))

(declare-fun res!158013 () Bool)

(assert (=> b!189537 (=> (not res!158013) (not e!130850))))

(declare-fun lt!294268 () tuple2!16386)

(assert (=> b!189537 (= res!158013 (and (= (_2!8838 lt!294268) lt!294285) (= (_1!8838 lt!294268) (_2!8835 lt!294283))))))

(declare-fun readerFrom!0 (BitStream!7826 (_ BitVec 32) (_ BitVec 32)) BitStream!7826)

(assert (=> b!189537 (= lt!294268 (readBitPure!0 (readerFrom!0 (_2!8835 lt!294283) (currentBit!9100 thiss!1204) (currentByte!9105 thiss!1204))))))

(declare-fun b!189538 () Bool)

(declare-fun e!130846 () Bool)

(assert (=> b!189538 (= e!130857 e!130846)))

(declare-fun res!158031 () Bool)

(assert (=> b!189538 (=> res!158031 e!130846)))

(assert (=> b!189538 (= res!158031 (not (= (_1!8836 lt!294277) lt!294286)))))

(assert (=> b!189538 e!130848))

(declare-fun res!158016 () Bool)

(assert (=> b!189538 (=> (not res!158016) (not e!130848))))

(declare-fun lt!294281 () tuple2!16384)

(assert (=> b!189538 (= res!158016 (and (= (_2!8837 lt!294295) (_2!8837 lt!294281)) (= (_1!8837 lt!294295) (_1!8837 lt!294281))))))

(declare-fun lt!294284 () Unit!13517)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13517)

(assert (=> b!189538 (= lt!294284 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8836 lt!294276) nBits!348 i!590 lt!294267))))

(assert (=> b!189538 (= lt!294281 (readNBitsLSBFirstsLoopPure!0 lt!294286 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294275))))

(assert (=> b!189538 (= lt!294286 (withMovedBitIndex!0 (_1!8836 lt!294276) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189539 () Bool)

(declare-fun res!158015 () Bool)

(assert (=> b!189539 (=> (not res!158015) (not e!130848))))

(assert (=> b!189539 (= res!158015 (= (_1!8836 lt!294276) (withMovedBitIndex!0 (_2!8836 lt!294276) (bvsub lt!294292 lt!294270))))))

(declare-fun b!189540 () Bool)

(declare-fun res!158030 () Bool)

(assert (=> b!189540 (=> res!158030 e!130846)))

(assert (=> b!189540 (= res!158030 (not (= (bitIndex!0 (size!4359 (buf!4833 (_1!8837 lt!294295))) (currentByte!9105 (_1!8837 lt!294295)) (currentBit!9100 (_1!8837 lt!294295))) (bitIndex!0 (size!4359 (buf!4833 (_2!8836 lt!294276))) (currentByte!9105 (_2!8836 lt!294276)) (currentBit!9100 (_2!8836 lt!294276))))))))

(declare-fun b!189541 () Bool)

(declare-fun array_inv!4100 (array!9888) Bool)

(assert (=> b!189541 (= e!130858 (array_inv!4100 (buf!4833 thiss!1204)))))

(declare-fun b!189542 () Bool)

(declare-fun res!158019 () Bool)

(assert (=> b!189542 (=> res!158019 e!130847)))

(assert (=> b!189542 (= res!158019 (not (isPrefixOf!0 thiss!1204 (_2!8835 lt!294283))))))

(declare-fun b!189543 () Bool)

(assert (=> b!189543 (= e!130846 true)))

(assert (=> b!189543 (= (size!4359 (buf!4833 thiss!1204)) (size!4359 (buf!4833 (_2!8835 lt!294269))))))

(declare-fun b!189544 () Bool)

(declare-fun res!158029 () Bool)

(assert (=> b!189544 (=> (not res!158029) (not e!130859))))

(assert (=> b!189544 (= res!158029 (isPrefixOf!0 thiss!1204 (_2!8835 lt!294283)))))

(declare-fun b!189545 () Bool)

(assert (=> b!189545 (= e!130855 e!130859)))

(declare-fun res!158028 () Bool)

(assert (=> b!189545 (=> (not res!158028) (not e!130859))))

(declare-fun lt!294282 () (_ BitVec 64))

(declare-fun lt!294280 () (_ BitVec 64))

(assert (=> b!189545 (= res!158028 (= lt!294282 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294280)))))

(assert (=> b!189545 (= lt!294282 (bitIndex!0 (size!4359 (buf!4833 (_2!8835 lt!294283))) (currentByte!9105 (_2!8835 lt!294283)) (currentBit!9100 (_2!8835 lt!294283))))))

(assert (=> b!189545 (= lt!294280 (bitIndex!0 (size!4359 (buf!4833 thiss!1204)) (currentByte!9105 thiss!1204) (currentBit!9100 thiss!1204)))))

(declare-fun b!189546 () Bool)

(assert (=> b!189546 (= e!130850 (= (bitIndex!0 (size!4359 (buf!4833 (_1!8838 lt!294268))) (currentByte!9105 (_1!8838 lt!294268)) (currentBit!9100 (_1!8838 lt!294268))) lt!294282))))

(declare-fun b!189547 () Bool)

(declare-fun res!158025 () Bool)

(assert (=> b!189547 (=> res!158025 e!130847)))

(assert (=> b!189547 (= res!158025 (not (isPrefixOf!0 (_2!8835 lt!294283) (_2!8835 lt!294269))))))

(declare-fun b!189548 () Bool)

(declare-fun res!158022 () Bool)

(assert (=> b!189548 (=> res!158022 e!130847)))

(assert (=> b!189548 (= res!158022 (not (invariant!0 (currentBit!9100 (_2!8835 lt!294269)) (currentByte!9105 (_2!8835 lt!294269)) (size!4359 (buf!4833 (_2!8835 lt!294269))))))))

(assert (= (and start!40998 res!158023) b!189526))

(assert (= (and b!189526 res!158021) b!189535))

(assert (= (and b!189535 res!158024) b!189534))

(assert (= (and b!189534 res!158027) b!189528))

(assert (= (and b!189528 res!158017) b!189545))

(assert (= (and b!189545 res!158028) b!189544))

(assert (= (and b!189544 res!158029) b!189537))

(assert (= (and b!189537 res!158013) b!189546))

(assert (= (and b!189528 (not res!158011)) b!189531))

(assert (= (and b!189531 (not res!158026)) b!189548))

(assert (= (and b!189548 (not res!158022)) b!189527))

(assert (= (and b!189527 (not res!158012)) b!189547))

(assert (= (and b!189547 (not res!158025)) b!189542))

(assert (= (and b!189542 (not res!158019)) b!189533))

(assert (= (and b!189533 res!158018) b!189532))

(assert (= (and b!189533 res!158020) b!189530))

(assert (= (and b!189533 (not res!158010)) b!189538))

(assert (= (and b!189538 res!158016) b!189539))

(assert (= (and b!189539 res!158015) b!189536))

(assert (= (and b!189536 res!158014) b!189529))

(assert (= (and b!189538 (not res!158031)) b!189540))

(assert (= (and b!189540 (not res!158030)) b!189543))

(assert (= start!40998 b!189541))

(declare-fun m!294553 () Bool)

(assert (=> b!189547 m!294553))

(declare-fun m!294555 () Bool)

(assert (=> b!189528 m!294555))

(declare-fun m!294557 () Bool)

(assert (=> b!189528 m!294557))

(declare-fun m!294559 () Bool)

(assert (=> b!189528 m!294559))

(declare-fun m!294561 () Bool)

(assert (=> b!189541 m!294561))

(assert (=> b!189545 m!294555))

(assert (=> b!189545 m!294557))

(declare-fun m!294563 () Bool)

(assert (=> b!189526 m!294563))

(declare-fun m!294565 () Bool)

(assert (=> b!189542 m!294565))

(declare-fun m!294567 () Bool)

(assert (=> b!189537 m!294567))

(assert (=> b!189537 m!294567))

(declare-fun m!294569 () Bool)

(assert (=> b!189537 m!294569))

(declare-fun m!294571 () Bool)

(assert (=> b!189535 m!294571))

(declare-fun m!294573 () Bool)

(assert (=> b!189546 m!294573))

(declare-fun m!294575 () Bool)

(assert (=> b!189540 m!294575))

(declare-fun m!294577 () Bool)

(assert (=> b!189540 m!294577))

(assert (=> b!189544 m!294565))

(declare-fun m!294579 () Bool)

(assert (=> b!189532 m!294579))

(declare-fun m!294581 () Bool)

(assert (=> b!189536 m!294581))

(declare-fun m!294583 () Bool)

(assert (=> b!189533 m!294583))

(declare-fun m!294585 () Bool)

(assert (=> b!189533 m!294585))

(declare-fun m!294587 () Bool)

(assert (=> b!189533 m!294587))

(declare-fun m!294589 () Bool)

(assert (=> b!189533 m!294589))

(declare-fun m!294591 () Bool)

(assert (=> b!189533 m!294591))

(declare-fun m!294593 () Bool)

(assert (=> b!189533 m!294593))

(declare-fun m!294595 () Bool)

(assert (=> b!189533 m!294595))

(declare-fun m!294597 () Bool)

(assert (=> b!189533 m!294597))

(declare-fun m!294599 () Bool)

(assert (=> b!189533 m!294599))

(declare-fun m!294601 () Bool)

(assert (=> b!189533 m!294601))

(declare-fun m!294603 () Bool)

(assert (=> b!189533 m!294603))

(declare-fun m!294605 () Bool)

(assert (=> b!189533 m!294605))

(declare-fun m!294607 () Bool)

(assert (=> b!189533 m!294607))

(declare-fun m!294609 () Bool)

(assert (=> b!189533 m!294609))

(declare-fun m!294611 () Bool)

(assert (=> b!189533 m!294611))

(declare-fun m!294613 () Bool)

(assert (=> b!189533 m!294613))

(declare-fun m!294615 () Bool)

(assert (=> b!189539 m!294615))

(declare-fun m!294617 () Bool)

(assert (=> b!189548 m!294617))

(declare-fun m!294619 () Bool)

(assert (=> start!40998 m!294619))

(declare-fun m!294621 () Bool)

(assert (=> b!189531 m!294621))

(declare-fun m!294623 () Bool)

(assert (=> b!189531 m!294623))

(declare-fun m!294625 () Bool)

(assert (=> b!189531 m!294625))

(declare-fun m!294627 () Bool)

(assert (=> b!189531 m!294627))

(declare-fun m!294629 () Bool)

(assert (=> b!189538 m!294629))

(declare-fun m!294631 () Bool)

(assert (=> b!189538 m!294631))

(declare-fun m!294633 () Bool)

(assert (=> b!189538 m!294633))

(push 1)

(assert (not b!189538))

(assert (not b!189547))

(assert (not b!189540))

(assert (not b!189531))

(assert (not b!189539))

(assert (not b!189533))

(assert (not b!189541))

(assert (not b!189526))

(assert (not b!189542))

(assert (not b!189536))

(assert (not b!189535))

(assert (not b!189545))

(assert (not b!189532))

(assert (not b!189546))

(assert (not b!189537))

(assert (not b!189544))

(assert (not start!40998))

(assert (not b!189548))

(assert (not b!189528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

