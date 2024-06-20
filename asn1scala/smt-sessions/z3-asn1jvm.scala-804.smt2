; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23332 () Bool)

(assert start!23332)

(declare-fun b!118507 () Bool)

(declare-fun e!77680 () Bool)

(declare-datatypes ((array!5317 0))(
  ( (array!5318 (arr!3004 (Array (_ BitVec 32) (_ BitVec 8))) (size!2411 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4296 0))(
  ( (BitStream!4297 (buf!2830 array!5317) (currentByte!5485 (_ BitVec 32)) (currentBit!5480 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4296)

(declare-datatypes ((Unit!7293 0))(
  ( (Unit!7294) )
))
(declare-datatypes ((tuple2!9924 0))(
  ( (tuple2!9925 (_1!5227 Unit!7293) (_2!5227 BitStream!4296)) )
))
(declare-fun lt!182322 () tuple2!9924)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!118507 (= e!77680 (invariant!0 (currentBit!5480 thiss!1305) (currentByte!5485 thiss!1305) (size!2411 (buf!2830 (_2!5227 lt!182322)))))))

(declare-fun res!98069 () Bool)

(declare-fun e!77679 () Bool)

(assert (=> start!23332 (=> (not res!98069) (not e!77679))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23332 (= res!98069 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23332 e!77679))

(assert (=> start!23332 true))

(declare-fun e!77675 () Bool)

(declare-fun inv!12 (BitStream!4296) Bool)

(assert (=> start!23332 (and (inv!12 thiss!1305) e!77675)))

(declare-fun b!118508 () Bool)

(declare-fun e!77685 () Bool)

(declare-fun e!77683 () Bool)

(assert (=> b!118508 (= e!77685 e!77683)))

(declare-fun res!98077 () Bool)

(assert (=> b!118508 (=> (not res!98077) (not e!77683))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!182305 () (_ BitVec 64))

(assert (=> b!118508 (= res!98077 (and (= (bvand v!199 lt!182305) v!199) (bvslt i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118508 (= lt!182305 (onesLSBLong!0 nBits!396))))

(declare-fun b!118509 () Bool)

(declare-fun res!98078 () Bool)

(declare-fun e!77677 () Bool)

(assert (=> b!118509 (=> (not res!98078) (not e!77677))))

(declare-fun lt!182317 () tuple2!9924)

(declare-fun isPrefixOf!0 (BitStream!4296 BitStream!4296) Bool)

(assert (=> b!118509 (= res!98078 (isPrefixOf!0 thiss!1305 (_2!5227 lt!182317)))))

(declare-fun b!118510 () Bool)

(declare-fun res!98076 () Bool)

(assert (=> b!118510 (=> (not res!98076) (not e!77680))))

(assert (=> b!118510 (= res!98076 (invariant!0 (currentBit!5480 thiss!1305) (currentByte!5485 thiss!1305) (size!2411 (buf!2830 (_2!5227 lt!182317)))))))

(declare-fun b!118511 () Bool)

(declare-fun e!77684 () Bool)

(assert (=> b!118511 (= e!77683 (not e!77684))))

(declare-fun res!98075 () Bool)

(assert (=> b!118511 (=> res!98075 e!77684)))

(declare-fun lt!182312 () (_ BitVec 64))

(declare-datatypes ((tuple2!9926 0))(
  ( (tuple2!9927 (_1!5228 BitStream!4296) (_2!5228 BitStream!4296)) )
))
(declare-fun lt!182301 () tuple2!9926)

(declare-fun lt!182308 () (_ BitVec 64))

(declare-datatypes ((tuple2!9928 0))(
  ( (tuple2!9929 (_1!5229 BitStream!4296) (_2!5229 Bool)) )
))
(declare-fun lt!182310 () tuple2!9928)

(declare-datatypes ((tuple2!9930 0))(
  ( (tuple2!9931 (_1!5230 BitStream!4296) (_2!5230 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9930)

(assert (=> b!118511 (= res!98075 (not (= (_1!5230 (readNLeastSignificantBitsLoopPure!0 (_1!5228 lt!182301) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!182308 (ite (_2!5229 lt!182310) lt!182312 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5228 lt!182301))))))

(declare-fun lt!182315 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!118511 (validate_offset_bits!1 ((_ sign_extend 32) (size!2411 (buf!2830 (_2!5227 lt!182322)))) ((_ sign_extend 32) (currentByte!5485 (_2!5227 lt!182317))) ((_ sign_extend 32) (currentBit!5480 (_2!5227 lt!182317))) lt!182315)))

(declare-fun lt!182316 () Unit!7293)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4296 array!5317 (_ BitVec 64)) Unit!7293)

(assert (=> b!118511 (= lt!182316 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5227 lt!182317) (buf!2830 (_2!5227 lt!182322)) lt!182315))))

(assert (=> b!118511 (= lt!182315 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!182306 () tuple2!9926)

(declare-fun lt!182320 () tuple2!9930)

(assert (=> b!118511 (= lt!182320 (readNLeastSignificantBitsLoopPure!0 (_1!5228 lt!182306) nBits!396 i!615 lt!182308))))

(declare-fun lt!182300 () (_ BitVec 64))

(assert (=> b!118511 (validate_offset_bits!1 ((_ sign_extend 32) (size!2411 (buf!2830 (_2!5227 lt!182322)))) ((_ sign_extend 32) (currentByte!5485 thiss!1305)) ((_ sign_extend 32) (currentBit!5480 thiss!1305)) lt!182300)))

(declare-fun lt!182311 () Unit!7293)

(assert (=> b!118511 (= lt!182311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2830 (_2!5227 lt!182322)) lt!182300))))

(declare-fun lt!182307 () (_ BitVec 64))

(assert (=> b!118511 (= lt!182308 (bvand v!199 (bvnot lt!182307)))))

(assert (=> b!118511 (= lt!182307 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!182321 () Bool)

(assert (=> b!118511 (= (_2!5229 lt!182310) lt!182321)))

(declare-fun readBitPure!0 (BitStream!4296) tuple2!9928)

(assert (=> b!118511 (= lt!182310 (readBitPure!0 (_1!5228 lt!182306)))))

(declare-fun reader!0 (BitStream!4296 BitStream!4296) tuple2!9926)

(assert (=> b!118511 (= lt!182301 (reader!0 (_2!5227 lt!182317) (_2!5227 lt!182322)))))

(assert (=> b!118511 (= lt!182306 (reader!0 thiss!1305 (_2!5227 lt!182322)))))

(declare-fun e!77678 () Bool)

(assert (=> b!118511 e!77678))

(declare-fun res!98070 () Bool)

(assert (=> b!118511 (=> (not res!98070) (not e!77678))))

(declare-fun lt!182313 () tuple2!9928)

(declare-fun lt!182309 () tuple2!9928)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!118511 (= res!98070 (= (bitIndex!0 (size!2411 (buf!2830 (_1!5229 lt!182313))) (currentByte!5485 (_1!5229 lt!182313)) (currentBit!5480 (_1!5229 lt!182313))) (bitIndex!0 (size!2411 (buf!2830 (_1!5229 lt!182309))) (currentByte!5485 (_1!5229 lt!182309)) (currentBit!5480 (_1!5229 lt!182309)))))))

(declare-fun lt!182318 () Unit!7293)

(declare-fun lt!182302 () BitStream!4296)

(declare-fun readBitPrefixLemma!0 (BitStream!4296 BitStream!4296) Unit!7293)

(assert (=> b!118511 (= lt!182318 (readBitPrefixLemma!0 lt!182302 (_2!5227 lt!182322)))))

(assert (=> b!118511 (= lt!182309 (readBitPure!0 (BitStream!4297 (buf!2830 (_2!5227 lt!182322)) (currentByte!5485 thiss!1305) (currentBit!5480 thiss!1305))))))

(assert (=> b!118511 (= lt!182313 (readBitPure!0 lt!182302))))

(assert (=> b!118511 (= lt!182302 (BitStream!4297 (buf!2830 (_2!5227 lt!182317)) (currentByte!5485 thiss!1305) (currentBit!5480 thiss!1305)))))

(assert (=> b!118511 e!77680))

(declare-fun res!98071 () Bool)

(assert (=> b!118511 (=> (not res!98071) (not e!77680))))

(assert (=> b!118511 (= res!98071 (isPrefixOf!0 thiss!1305 (_2!5227 lt!182322)))))

(declare-fun lt!182303 () Unit!7293)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4296 BitStream!4296 BitStream!4296) Unit!7293)

(assert (=> b!118511 (= lt!182303 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5227 lt!182317) (_2!5227 lt!182322)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4296 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9924)

(assert (=> b!118511 (= lt!182322 (appendNLeastSignificantBitsLoop!0 (_2!5227 lt!182317) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!77682 () Bool)

(assert (=> b!118511 e!77682))

(declare-fun res!98073 () Bool)

(assert (=> b!118511 (=> (not res!98073) (not e!77682))))

(assert (=> b!118511 (= res!98073 (= (size!2411 (buf!2830 thiss!1305)) (size!2411 (buf!2830 (_2!5227 lt!182317)))))))

(declare-fun appendBit!0 (BitStream!4296 Bool) tuple2!9924)

(assert (=> b!118511 (= lt!182317 (appendBit!0 thiss!1305 lt!182321))))

(assert (=> b!118511 (= lt!182321 (not (= (bvand v!199 lt!182312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!118511 (= lt!182312 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!118512 () Bool)

(assert (=> b!118512 (= e!77679 e!77685)))

(declare-fun res!98074 () Bool)

(assert (=> b!118512 (=> (not res!98074) (not e!77685))))

(assert (=> b!118512 (= res!98074 (validate_offset_bits!1 ((_ sign_extend 32) (size!2411 (buf!2830 thiss!1305))) ((_ sign_extend 32) (currentByte!5485 thiss!1305)) ((_ sign_extend 32) (currentBit!5480 thiss!1305)) lt!182300))))

(assert (=> b!118512 (= lt!182300 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!118513 () Bool)

(declare-fun e!77681 () Bool)

(declare-fun lt!182319 () tuple2!9928)

(declare-fun lt!182314 () (_ BitVec 64))

(assert (=> b!118513 (= e!77681 (= (bitIndex!0 (size!2411 (buf!2830 (_1!5229 lt!182319))) (currentByte!5485 (_1!5229 lt!182319)) (currentBit!5480 (_1!5229 lt!182319))) lt!182314))))

(declare-fun b!118514 () Bool)

(assert (=> b!118514 (= e!77682 e!77677)))

(declare-fun res!98079 () Bool)

(assert (=> b!118514 (=> (not res!98079) (not e!77677))))

(declare-fun lt!182304 () (_ BitVec 64))

(assert (=> b!118514 (= res!98079 (= lt!182314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!182304)))))

(assert (=> b!118514 (= lt!182314 (bitIndex!0 (size!2411 (buf!2830 (_2!5227 lt!182317))) (currentByte!5485 (_2!5227 lt!182317)) (currentBit!5480 (_2!5227 lt!182317))))))

(assert (=> b!118514 (= lt!182304 (bitIndex!0 (size!2411 (buf!2830 thiss!1305)) (currentByte!5485 thiss!1305) (currentBit!5480 thiss!1305)))))

(declare-fun b!118515 () Bool)

(declare-fun res!98072 () Bool)

(assert (=> b!118515 (=> res!98072 e!77684)))

(assert (=> b!118515 (= res!98072 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2411 (buf!2830 (_1!5228 lt!182306)))) ((_ sign_extend 32) (currentByte!5485 (_1!5228 lt!182306))) ((_ sign_extend 32) (currentBit!5480 (_1!5228 lt!182306))) lt!182300)))))

(declare-fun b!118516 () Bool)

(declare-fun array_inv!2213 (array!5317) Bool)

(assert (=> b!118516 (= e!77675 (array_inv!2213 (buf!2830 thiss!1305)))))

(declare-fun b!118517 () Bool)

(assert (=> b!118517 (= e!77677 e!77681)))

(declare-fun res!98068 () Bool)

(assert (=> b!118517 (=> (not res!98068) (not e!77681))))

(assert (=> b!118517 (= res!98068 (and (= (_2!5229 lt!182319) lt!182321) (= (_1!5229 lt!182319) (_2!5227 lt!182317))))))

(declare-fun readerFrom!0 (BitStream!4296 (_ BitVec 32) (_ BitVec 32)) BitStream!4296)

(assert (=> b!118517 (= lt!182319 (readBitPure!0 (readerFrom!0 (_2!5227 lt!182317) (currentBit!5480 thiss!1305) (currentByte!5485 thiss!1305))))))

(declare-fun b!118518 () Bool)

(assert (=> b!118518 (= e!77684 (or (not (= (bvand lt!182308 lt!182307) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!182308 lt!182305) lt!182308)))))

(declare-fun b!118519 () Bool)

(assert (=> b!118519 (= e!77678 (= (_2!5229 lt!182313) (_2!5229 lt!182309)))))

(assert (= (and start!23332 res!98069) b!118512))

(assert (= (and b!118512 res!98074) b!118508))

(assert (= (and b!118508 res!98077) b!118511))

(assert (= (and b!118511 res!98073) b!118514))

(assert (= (and b!118514 res!98079) b!118509))

(assert (= (and b!118509 res!98078) b!118517))

(assert (= (and b!118517 res!98068) b!118513))

(assert (= (and b!118511 res!98071) b!118510))

(assert (= (and b!118510 res!98076) b!118507))

(assert (= (and b!118511 res!98070) b!118519))

(assert (= (and b!118511 (not res!98075)) b!118515))

(assert (= (and b!118515 (not res!98072)) b!118518))

(assert (= start!23332 b!118516))

(declare-fun m!178029 () Bool)

(assert (=> b!118515 m!178029))

(declare-fun m!178031 () Bool)

(assert (=> b!118514 m!178031))

(declare-fun m!178033 () Bool)

(assert (=> b!118514 m!178033))

(declare-fun m!178035 () Bool)

(assert (=> b!118510 m!178035))

(declare-fun m!178037 () Bool)

(assert (=> b!118512 m!178037))

(declare-fun m!178039 () Bool)

(assert (=> b!118511 m!178039))

(declare-fun m!178041 () Bool)

(assert (=> b!118511 m!178041))

(declare-fun m!178043 () Bool)

(assert (=> b!118511 m!178043))

(declare-fun m!178045 () Bool)

(assert (=> b!118511 m!178045))

(declare-fun m!178047 () Bool)

(assert (=> b!118511 m!178047))

(declare-fun m!178049 () Bool)

(assert (=> b!118511 m!178049))

(declare-fun m!178051 () Bool)

(assert (=> b!118511 m!178051))

(declare-fun m!178053 () Bool)

(assert (=> b!118511 m!178053))

(declare-fun m!178055 () Bool)

(assert (=> b!118511 m!178055))

(declare-fun m!178057 () Bool)

(assert (=> b!118511 m!178057))

(declare-fun m!178059 () Bool)

(assert (=> b!118511 m!178059))

(declare-fun m!178061 () Bool)

(assert (=> b!118511 m!178061))

(declare-fun m!178063 () Bool)

(assert (=> b!118511 m!178063))

(declare-fun m!178065 () Bool)

(assert (=> b!118511 m!178065))

(declare-fun m!178067 () Bool)

(assert (=> b!118511 m!178067))

(declare-fun m!178069 () Bool)

(assert (=> b!118511 m!178069))

(declare-fun m!178071 () Bool)

(assert (=> b!118511 m!178071))

(declare-fun m!178073 () Bool)

(assert (=> b!118511 m!178073))

(declare-fun m!178075 () Bool)

(assert (=> b!118511 m!178075))

(declare-fun m!178077 () Bool)

(assert (=> b!118517 m!178077))

(assert (=> b!118517 m!178077))

(declare-fun m!178079 () Bool)

(assert (=> b!118517 m!178079))

(declare-fun m!178081 () Bool)

(assert (=> b!118513 m!178081))

(declare-fun m!178083 () Bool)

(assert (=> b!118509 m!178083))

(declare-fun m!178085 () Bool)

(assert (=> start!23332 m!178085))

(declare-fun m!178087 () Bool)

(assert (=> b!118507 m!178087))

(declare-fun m!178089 () Bool)

(assert (=> b!118516 m!178089))

(declare-fun m!178091 () Bool)

(assert (=> b!118508 m!178091))

(check-sat (not b!118517) (not start!23332) (not b!118514) (not b!118508) (not b!118507) (not b!118511) (not b!118513) (not b!118512) (not b!118509) (not b!118510) (not b!118515) (not b!118516))
(check-sat)
