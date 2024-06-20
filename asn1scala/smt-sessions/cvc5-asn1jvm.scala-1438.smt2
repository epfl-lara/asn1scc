; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39512 () Bool)

(assert start!39512)

(declare-fun b!177810 () Bool)

(declare-fun e!123875 () Bool)

(declare-fun e!123873 () Bool)

(assert (=> b!177810 (= e!123875 e!123873)))

(declare-fun res!147423 () Bool)

(assert (=> b!177810 (=> (not res!147423) (not e!123873))))

(declare-fun lt!273207 () (_ BitVec 64))

(declare-fun lt!273208 () (_ BitVec 64))

(assert (=> b!177810 (= res!147423 (= lt!273207 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!273208)))))

(declare-datatypes ((array!9590 0))(
  ( (array!9591 (arr!5158 (Array (_ BitVec 32) (_ BitVec 8))) (size!4228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7564 0))(
  ( (BitStream!7565 (buf!4671 array!9590) (currentByte!8860 (_ BitVec 32)) (currentBit!8855 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12803 0))(
  ( (Unit!12804) )
))
(declare-datatypes ((tuple2!15326 0))(
  ( (tuple2!15327 (_1!8308 Unit!12803) (_2!8308 BitStream!7564)) )
))
(declare-fun lt!273210 () tuple2!15326)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177810 (= lt!273207 (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))))))

(declare-fun thiss!1204 () BitStream!7564)

(assert (=> b!177810 (= lt!273208 (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)))))

(declare-fun b!177811 () Bool)

(declare-fun e!123872 () Bool)

(declare-datatypes ((tuple2!15328 0))(
  ( (tuple2!15329 (_1!8309 BitStream!7564) (_2!8309 Bool)) )
))
(declare-fun lt!273209 () tuple2!15328)

(assert (=> b!177811 (= e!123872 (= (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273209))) (currentByte!8860 (_1!8309 lt!273209)) (currentBit!8855 (_1!8309 lt!273209))) lt!273207))))

(declare-fun b!177812 () Bool)

(declare-fun res!147419 () Bool)

(declare-fun e!123877 () Bool)

(assert (=> b!177812 (=> (not res!147419) (not e!123877))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177812 (= res!147419 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))) ((_ sign_extend 32) (currentByte!8860 thiss!1204)) ((_ sign_extend 32) (currentBit!8855 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177813 () Bool)

(declare-fun e!123876 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177813 (= e!123876 (invariant!0 (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(declare-fun lt!273211 () tuple2!15326)

(declare-fun isPrefixOf!0 (BitStream!7564 BitStream!7564) Bool)

(assert (=> b!177813 (isPrefixOf!0 thiss!1204 (_2!8308 lt!273211))))

(declare-fun lt!273212 () Unit!12803)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7564 BitStream!7564 BitStream!7564) Unit!12803)

(assert (=> b!177813 (= lt!273212 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8308 lt!273210) (_2!8308 lt!273211)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7564 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15326)

(assert (=> b!177813 (= lt!273211 (appendBitsLSBFirstLoopTR!0 (_2!8308 lt!273210) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177814 () Bool)

(declare-fun e!123871 () Bool)

(declare-fun array_inv!3969 (array!9590) Bool)

(assert (=> b!177814 (= e!123871 (array_inv!3969 (buf!4671 thiss!1204)))))

(declare-fun res!147424 () Bool)

(assert (=> start!39512 (=> (not res!147424) (not e!123877))))

(assert (=> start!39512 (= res!147424 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39512 e!123877))

(assert (=> start!39512 true))

(declare-fun inv!12 (BitStream!7564) Bool)

(assert (=> start!39512 (and (inv!12 thiss!1204) e!123871)))

(declare-fun b!177815 () Bool)

(assert (=> b!177815 (= e!123877 (not e!123876))))

(declare-fun res!147422 () Bool)

(assert (=> b!177815 (=> res!147422 e!123876)))

(assert (=> b!177815 (= res!147422 (not (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204))))))))

(assert (=> b!177815 e!123875))

(declare-fun res!147418 () Bool)

(assert (=> b!177815 (=> (not res!147418) (not e!123875))))

(assert (=> b!177815 (= res!147418 (= (size!4228 (buf!4671 thiss!1204)) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(declare-fun lt!273206 () Bool)

(declare-fun appendBit!0 (BitStream!7564 Bool) tuple2!15326)

(assert (=> b!177815 (= lt!273210 (appendBit!0 thiss!1204 lt!273206))))

(assert (=> b!177815 (= lt!273206 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177816 () Bool)

(declare-fun res!147420 () Bool)

(assert (=> b!177816 (=> (not res!147420) (not e!123873))))

(assert (=> b!177816 (= res!147420 (isPrefixOf!0 thiss!1204 (_2!8308 lt!273210)))))

(declare-fun b!177817 () Bool)

(declare-fun res!147421 () Bool)

(assert (=> b!177817 (=> (not res!147421) (not e!123877))))

(assert (=> b!177817 (= res!147421 (not (= i!590 nBits!348)))))

(declare-fun b!177818 () Bool)

(assert (=> b!177818 (= e!123873 e!123872)))

(declare-fun res!147426 () Bool)

(assert (=> b!177818 (=> (not res!147426) (not e!123872))))

(assert (=> b!177818 (= res!147426 (and (= (_2!8309 lt!273209) lt!273206) (= (_1!8309 lt!273209) (_2!8308 lt!273210))))))

(declare-fun readBitPure!0 (BitStream!7564) tuple2!15328)

(declare-fun readerFrom!0 (BitStream!7564 (_ BitVec 32) (_ BitVec 32)) BitStream!7564)

(assert (=> b!177818 (= lt!273209 (readBitPure!0 (readerFrom!0 (_2!8308 lt!273210) (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204))))))

(declare-fun b!177819 () Bool)

(declare-fun res!147425 () Bool)

(assert (=> b!177819 (=> (not res!147425) (not e!123877))))

(assert (=> b!177819 (= res!147425 (invariant!0 (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204))))))

(assert (= (and start!39512 res!147424) b!177812))

(assert (= (and b!177812 res!147419) b!177819))

(assert (= (and b!177819 res!147425) b!177817))

(assert (= (and b!177817 res!147421) b!177815))

(assert (= (and b!177815 res!147418) b!177810))

(assert (= (and b!177810 res!147423) b!177816))

(assert (= (and b!177816 res!147420) b!177818))

(assert (= (and b!177818 res!147426) b!177811))

(assert (= (and b!177815 (not res!147422)) b!177813))

(assert (= start!39512 b!177814))

(declare-fun m!277837 () Bool)

(assert (=> b!177816 m!277837))

(declare-fun m!277839 () Bool)

(assert (=> b!177810 m!277839))

(declare-fun m!277841 () Bool)

(assert (=> b!177810 m!277841))

(declare-fun m!277843 () Bool)

(assert (=> b!177818 m!277843))

(assert (=> b!177818 m!277843))

(declare-fun m!277845 () Bool)

(assert (=> b!177818 m!277845))

(declare-fun m!277847 () Bool)

(assert (=> b!177813 m!277847))

(declare-fun m!277849 () Bool)

(assert (=> b!177813 m!277849))

(declare-fun m!277851 () Bool)

(assert (=> b!177813 m!277851))

(declare-fun m!277853 () Bool)

(assert (=> b!177813 m!277853))

(declare-fun m!277855 () Bool)

(assert (=> b!177814 m!277855))

(assert (=> b!177815 m!277839))

(assert (=> b!177815 m!277841))

(declare-fun m!277857 () Bool)

(assert (=> b!177815 m!277857))

(declare-fun m!277859 () Bool)

(assert (=> b!177811 m!277859))

(declare-fun m!277861 () Bool)

(assert (=> start!39512 m!277861))

(declare-fun m!277863 () Bool)

(assert (=> b!177819 m!277863))

(declare-fun m!277865 () Bool)

(assert (=> b!177812 m!277865))

(push 1)

(assert (not b!177818))

(assert (not b!177816))

(assert (not b!177812))

(assert (not b!177811))

(assert (not b!177815))

(assert (not b!177810))

(assert (not b!177814))

(assert (not b!177813))

(assert (not start!39512))

(assert (not b!177819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62549 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62549 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))) ((_ sign_extend 32) (currentByte!8860 thiss!1204)) ((_ sign_extend 32) (currentBit!8855 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))) ((_ sign_extend 32) (currentByte!8860 thiss!1204)) ((_ sign_extend 32) (currentBit!8855 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15594 () Bool)

(assert (= bs!15594 d!62549))

(declare-fun m!277933 () Bool)

(assert (=> bs!15594 m!277933))

(assert (=> b!177812 d!62549))

(declare-fun d!62551 () Bool)

(declare-datatypes ((tuple2!15346 0))(
  ( (tuple2!15347 (_1!8318 Bool) (_2!8318 BitStream!7564)) )
))
(declare-fun lt!273260 () tuple2!15346)

(declare-fun readBit!0 (BitStream!7564) tuple2!15346)

(assert (=> d!62551 (= lt!273260 (readBit!0 (readerFrom!0 (_2!8308 lt!273210) (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204))))))

(assert (=> d!62551 (= (readBitPure!0 (readerFrom!0 (_2!8308 lt!273210) (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204))) (tuple2!15329 (_2!8318 lt!273260) (_1!8318 lt!273260)))))

(declare-fun bs!15595 () Bool)

(assert (= bs!15595 d!62551))

(assert (=> bs!15595 m!277843))

(declare-fun m!277935 () Bool)

(assert (=> bs!15595 m!277935))

(assert (=> b!177818 d!62551))

(declare-fun d!62553 () Bool)

(declare-fun e!123928 () Bool)

(assert (=> d!62553 e!123928))

(declare-fun res!147493 () Bool)

(assert (=> d!62553 (=> (not res!147493) (not e!123928))))

(assert (=> d!62553 (= res!147493 (invariant!0 (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(assert (=> d!62553 (= (readerFrom!0 (_2!8308 lt!273210) (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204)) (BitStream!7565 (buf!4671 (_2!8308 lt!273210)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)))))

(declare-fun b!177891 () Bool)

(assert (=> b!177891 (= e!123928 (invariant!0 (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(assert (= (and d!62553 res!147493) b!177891))

(assert (=> d!62553 m!277847))

(declare-fun m!277937 () Bool)

(assert (=> b!177891 m!277937))

(assert (=> b!177818 d!62553))

(declare-fun d!62555 () Bool)

(assert (=> d!62555 (= (invariant!0 (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210)))) (and (bvsge (currentBit!8855 (_2!8308 lt!273210)) #b00000000000000000000000000000000) (bvslt (currentBit!8855 (_2!8308 lt!273210)) #b00000000000000000000000000001000) (bvsge (currentByte!8860 (_2!8308 lt!273210)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210)))) (and (= (currentBit!8855 (_2!8308 lt!273210)) #b00000000000000000000000000000000) (= (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210))))))))))

(assert (=> b!177813 d!62555))

(declare-fun d!62557 () Bool)

(declare-fun res!147500 () Bool)

(declare-fun e!123934 () Bool)

(assert (=> d!62557 (=> (not res!147500) (not e!123934))))

(assert (=> d!62557 (= res!147500 (= (size!4228 (buf!4671 thiss!1204)) (size!4228 (buf!4671 (_2!8308 lt!273211)))))))

(assert (=> d!62557 (= (isPrefixOf!0 thiss!1204 (_2!8308 lt!273211)) e!123934)))

(declare-fun b!177898 () Bool)

(declare-fun res!147502 () Bool)

(assert (=> b!177898 (=> (not res!147502) (not e!123934))))

(assert (=> b!177898 (= res!147502 (bvsle (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273211))) (currentByte!8860 (_2!8308 lt!273211)) (currentBit!8855 (_2!8308 lt!273211)))))))

(declare-fun b!177899 () Bool)

(declare-fun e!123933 () Bool)

(assert (=> b!177899 (= e!123934 e!123933)))

(declare-fun res!147501 () Bool)

(assert (=> b!177899 (=> res!147501 e!123933)))

(assert (=> b!177899 (= res!147501 (= (size!4228 (buf!4671 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!177900 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9590 array!9590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177900 (= e!123933 (arrayBitRangesEq!0 (buf!4671 thiss!1204) (buf!4671 (_2!8308 lt!273211)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204))))))

(assert (= (and d!62557 res!147500) b!177898))

(assert (= (and b!177898 res!147502) b!177899))

(assert (= (and b!177899 (not res!147501)) b!177900))

(assert (=> b!177898 m!277841))

(declare-fun m!277939 () Bool)

(assert (=> b!177898 m!277939))

(assert (=> b!177900 m!277841))

(assert (=> b!177900 m!277841))

(declare-fun m!277941 () Bool)

(assert (=> b!177900 m!277941))

(assert (=> b!177813 d!62557))

(declare-fun d!62559 () Bool)

(assert (=> d!62559 (isPrefixOf!0 thiss!1204 (_2!8308 lt!273211))))

(declare-fun lt!273263 () Unit!12803)

(declare-fun choose!30 (BitStream!7564 BitStream!7564 BitStream!7564) Unit!12803)

(assert (=> d!62559 (= lt!273263 (choose!30 thiss!1204 (_2!8308 lt!273210) (_2!8308 lt!273211)))))

(assert (=> d!62559 (isPrefixOf!0 thiss!1204 (_2!8308 lt!273210))))

(assert (=> d!62559 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8308 lt!273210) (_2!8308 lt!273211)) lt!273263)))

(declare-fun bs!15596 () Bool)

(assert (= bs!15596 d!62559))

(assert (=> bs!15596 m!277849))

(declare-fun m!277943 () Bool)

(assert (=> bs!15596 m!277943))

(assert (=> bs!15596 m!277837))

(assert (=> b!177813 d!62559))

(declare-fun b!178096 () Bool)

(declare-fun e!124051 () Bool)

(declare-datatypes ((tuple2!15348 0))(
  ( (tuple2!15349 (_1!8319 BitStream!7564) (_2!8319 (_ BitVec 64))) )
))
(declare-fun lt!273806 () tuple2!15348)

(declare-datatypes ((tuple2!15350 0))(
  ( (tuple2!15351 (_1!8320 BitStream!7564) (_2!8320 BitStream!7564)) )
))
(declare-fun lt!273853 () tuple2!15350)

(assert (=> b!178096 (= e!124051 (= (_1!8319 lt!273806) (_2!8320 lt!273853)))))

(declare-fun b!178097 () Bool)

(declare-fun e!124045 () (_ BitVec 64))

(assert (=> b!178097 (= e!124045 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!178098 () Bool)

(declare-fun res!147672 () Bool)

(declare-fun e!124047 () Bool)

(assert (=> b!178098 (=> (not res!147672) (not e!124047))))

(declare-fun lt!273831 () (_ BitVec 64))

(declare-fun lt!273814 () tuple2!15326)

(declare-fun lt!273811 () (_ BitVec 64))

(assert (=> b!178098 (= res!147672 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273814))) (currentByte!8860 (_2!8308 lt!273814)) (currentBit!8855 (_2!8308 lt!273814))) (bvsub lt!273831 lt!273811)))))

(assert (=> b!178098 (or (= (bvand lt!273831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273831 lt!273811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178098 (= lt!273811 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!273813 () (_ BitVec 64))

(declare-fun lt!273817 () (_ BitVec 64))

(assert (=> b!178098 (= lt!273831 (bvadd lt!273813 lt!273817))))

(assert (=> b!178098 (or (not (= (bvand lt!273813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273817 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273813 lt!273817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178098 (= lt!273817 ((_ sign_extend 32) nBits!348))))

(assert (=> b!178098 (= lt!273813 (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))))))

(declare-fun b!178099 () Bool)

(declare-fun e!124048 () Bool)

(declare-fun lt!273819 () tuple2!15328)

(declare-fun lt!273821 () tuple2!15328)

(assert (=> b!178099 (= e!124048 (= (_2!8309 lt!273819) (_2!8309 lt!273821)))))

(declare-fun b!178100 () Bool)

(declare-fun res!147673 () Bool)

(assert (=> b!178100 (=> (not res!147673) (not e!124047))))

(assert (=> b!178100 (= res!147673 (= (size!4228 (buf!4671 (_2!8308 lt!273210))) (size!4228 (buf!4671 (_2!8308 lt!273814)))))))

(declare-fun b!178101 () Bool)

(assert (=> b!178101 (= e!124045 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!178102 () Bool)

(declare-fun e!124049 () Bool)

(declare-fun lt!273840 () tuple2!15348)

(declare-fun lt!273841 () tuple2!15350)

(assert (=> b!178102 (= e!124049 (= (_1!8319 lt!273840) (_2!8320 lt!273841)))))

(declare-fun b!178103 () Bool)

(declare-fun e!124052 () Bool)

(declare-fun lt!273810 () (_ BitVec 64))

(assert (=> b!178103 (= e!124052 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273210)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210))) lt!273810))))

(declare-fun b!178104 () Bool)

(declare-fun res!147674 () Bool)

(assert (=> b!178104 (=> (not res!147674) (not e!124047))))

(assert (=> b!178104 (= res!147674 (isPrefixOf!0 (_2!8308 lt!273210) (_2!8308 lt!273814)))))

(declare-fun d!62561 () Bool)

(assert (=> d!62561 e!124047))

(declare-fun res!147667 () Bool)

(assert (=> d!62561 (=> (not res!147667) (not e!124047))))

(assert (=> d!62561 (= res!147667 (invariant!0 (currentBit!8855 (_2!8308 lt!273814)) (currentByte!8860 (_2!8308 lt!273814)) (size!4228 (buf!4671 (_2!8308 lt!273814)))))))

(declare-fun e!124046 () tuple2!15326)

(assert (=> d!62561 (= lt!273814 e!124046)))

(declare-fun c!9275 () Bool)

(assert (=> d!62561 (= c!9275 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62561 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62561 (= (appendBitsLSBFirstLoopTR!0 (_2!8308 lt!273210) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!273814)))

(declare-fun b!178105 () Bool)

(declare-fun res!147676 () Bool)

(declare-fun lt!273830 () tuple2!15326)

(assert (=> b!178105 (= res!147676 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273830))) (currentByte!8860 (_2!8308 lt!273830)) (currentBit!8855 (_2!8308 lt!273830))) (bvadd (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!124050 () Bool)

(assert (=> b!178105 (=> (not res!147676) (not e!124050))))

(declare-fun b!178106 () Bool)

(assert (=> b!178106 (= e!124047 e!124051)))

(declare-fun res!147670 () Bool)

(assert (=> b!178106 (=> (not res!147670) (not e!124051))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178106 (= res!147670 (= (_2!8319 lt!273806) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15348)

(assert (=> b!178106 (= lt!273806 (readNBitsLSBFirstsLoopPure!0 (_1!8320 lt!273853) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!273832 () Unit!12803)

(declare-fun lt!273823 () Unit!12803)

(assert (=> b!178106 (= lt!273832 lt!273823)))

(assert (=> b!178106 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273814)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210))) lt!273810)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7564 array!9590 (_ BitVec 64)) Unit!12803)

(assert (=> b!178106 (= lt!273823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8308 lt!273210) (buf!4671 (_2!8308 lt!273814)) lt!273810))))

(assert (=> b!178106 e!124052))

(declare-fun res!147666 () Bool)

(assert (=> b!178106 (=> (not res!147666) (not e!124052))))

(assert (=> b!178106 (= res!147666 (and (= (size!4228 (buf!4671 (_2!8308 lt!273210))) (size!4228 (buf!4671 (_2!8308 lt!273814)))) (bvsge lt!273810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178106 (= lt!273810 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!178106 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7564 BitStream!7564) tuple2!15350)

(assert (=> b!178106 (= lt!273853 (reader!0 (_2!8308 lt!273210) (_2!8308 lt!273814)))))

(declare-fun b!178107 () Bool)

(declare-fun lt!273860 () tuple2!15326)

(assert (=> b!178107 (= e!124046 (tuple2!15327 (_1!8308 lt!273860) (_2!8308 lt!273860)))))

(declare-fun lt!273825 () Bool)

(assert (=> b!178107 (= lt!273825 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178107 (= lt!273830 (appendBit!0 (_2!8308 lt!273210) lt!273825))))

(declare-fun res!147675 () Bool)

(assert (=> b!178107 (= res!147675 (= (size!4228 (buf!4671 (_2!8308 lt!273210))) (size!4228 (buf!4671 (_2!8308 lt!273830)))))))

(assert (=> b!178107 (=> (not res!147675) (not e!124050))))

(assert (=> b!178107 e!124050))

(declare-fun lt!273808 () tuple2!15326)

(assert (=> b!178107 (= lt!273808 lt!273830)))

(assert (=> b!178107 (= lt!273860 (appendBitsLSBFirstLoopTR!0 (_2!8308 lt!273808) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!273849 () Unit!12803)

(assert (=> b!178107 (= lt!273849 (lemmaIsPrefixTransitive!0 (_2!8308 lt!273210) (_2!8308 lt!273808) (_2!8308 lt!273860)))))

(declare-fun call!2927 () Bool)

(assert (=> b!178107 call!2927))

(declare-fun lt!273828 () Unit!12803)

(assert (=> b!178107 (= lt!273828 lt!273849)))

(assert (=> b!178107 (invariant!0 (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273808))))))

(declare-fun lt!273852 () BitStream!7564)

(assert (=> b!178107 (= lt!273852 (BitStream!7565 (buf!4671 (_2!8308 lt!273808)) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))))))

(assert (=> b!178107 (invariant!0 (currentBit!8855 lt!273852) (currentByte!8860 lt!273852) (size!4228 (buf!4671 (_2!8308 lt!273860))))))

(declare-fun lt!273839 () BitStream!7564)

(assert (=> b!178107 (= lt!273839 (BitStream!7565 (buf!4671 (_2!8308 lt!273860)) (currentByte!8860 lt!273852) (currentBit!8855 lt!273852)))))

(assert (=> b!178107 (= lt!273819 (readBitPure!0 lt!273852))))

(assert (=> b!178107 (= lt!273821 (readBitPure!0 lt!273839))))

(declare-fun lt!273848 () Unit!12803)

(declare-fun readBitPrefixLemma!0 (BitStream!7564 BitStream!7564) Unit!12803)

(assert (=> b!178107 (= lt!273848 (readBitPrefixLemma!0 lt!273852 (_2!8308 lt!273860)))))

(declare-fun res!147677 () Bool)

(assert (=> b!178107 (= res!147677 (= (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273819))) (currentByte!8860 (_1!8309 lt!273819)) (currentBit!8855 (_1!8309 lt!273819))) (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273821))) (currentByte!8860 (_1!8309 lt!273821)) (currentBit!8855 (_1!8309 lt!273821)))))))

(assert (=> b!178107 (=> (not res!147677) (not e!124048))))

(assert (=> b!178107 e!124048))

(declare-fun lt!273809 () Unit!12803)

(assert (=> b!178107 (= lt!273809 lt!273848)))

(declare-fun lt!273858 () tuple2!15350)

(assert (=> b!178107 (= lt!273858 (reader!0 (_2!8308 lt!273210) (_2!8308 lt!273860)))))

(declare-fun lt!273845 () tuple2!15350)

(assert (=> b!178107 (= lt!273845 (reader!0 (_2!8308 lt!273808) (_2!8308 lt!273860)))))

(declare-fun lt!273844 () tuple2!15328)

(assert (=> b!178107 (= lt!273844 (readBitPure!0 (_1!8320 lt!273858)))))

(assert (=> b!178107 (= (_2!8309 lt!273844) lt!273825)))

(declare-fun lt!273836 () Unit!12803)

(declare-fun Unit!12820 () Unit!12803)

(assert (=> b!178107 (= lt!273836 Unit!12820)))

(declare-fun lt!273854 () (_ BitVec 64))

(assert (=> b!178107 (= lt!273854 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273842 () (_ BitVec 64))

(assert (=> b!178107 (= lt!273842 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273807 () Unit!12803)

(assert (=> b!178107 (= lt!273807 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8308 lt!273210) (buf!4671 (_2!8308 lt!273860)) lt!273842))))

(assert (=> b!178107 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273860)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210))) lt!273842)))

(declare-fun lt!273824 () Unit!12803)

(assert (=> b!178107 (= lt!273824 lt!273807)))

(declare-fun lt!273847 () tuple2!15348)

(assert (=> b!178107 (= lt!273847 (readNBitsLSBFirstsLoopPure!0 (_1!8320 lt!273858) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273854))))

(declare-fun lt!273829 () (_ BitVec 64))

(assert (=> b!178107 (= lt!273829 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!273838 () Unit!12803)

(assert (=> b!178107 (= lt!273838 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8308 lt!273808) (buf!4671 (_2!8308 lt!273860)) lt!273829))))

(assert (=> b!178107 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273860)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273808))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273808))) lt!273829)))

(declare-fun lt!273833 () Unit!12803)

(assert (=> b!178107 (= lt!273833 lt!273838)))

(declare-fun lt!273822 () tuple2!15348)

(assert (=> b!178107 (= lt!273822 (readNBitsLSBFirstsLoopPure!0 (_1!8320 lt!273845) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273854 (ite (_2!8309 lt!273844) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!273850 () tuple2!15348)

(assert (=> b!178107 (= lt!273850 (readNBitsLSBFirstsLoopPure!0 (_1!8320 lt!273858) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273854))))

(declare-fun c!9276 () Bool)

(assert (=> b!178107 (= c!9276 (_2!8309 (readBitPure!0 (_1!8320 lt!273858))))))

(declare-fun lt!273835 () tuple2!15348)

(declare-fun withMovedBitIndex!0 (BitStream!7564 (_ BitVec 64)) BitStream!7564)

(assert (=> b!178107 (= lt!273835 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8320 lt!273858) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!273854 e!124045)))))

(declare-fun lt!273834 () Unit!12803)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12803)

(assert (=> b!178107 (= lt!273834 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8320 lt!273858) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!273854))))

(assert (=> b!178107 (and (= (_2!8319 lt!273850) (_2!8319 lt!273835)) (= (_1!8319 lt!273850) (_1!8319 lt!273835)))))

(declare-fun lt!273820 () Unit!12803)

(assert (=> b!178107 (= lt!273820 lt!273834)))

(assert (=> b!178107 (= (_1!8320 lt!273858) (withMovedBitIndex!0 (_2!8320 lt!273858) (bvsub (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273860))) (currentByte!8860 (_2!8308 lt!273860)) (currentBit!8855 (_2!8308 lt!273860))))))))

(declare-fun lt!273856 () Unit!12803)

(declare-fun Unit!12822 () Unit!12803)

(assert (=> b!178107 (= lt!273856 Unit!12822)))

(assert (=> b!178107 (= (_1!8320 lt!273845) (withMovedBitIndex!0 (_2!8320 lt!273845) (bvsub (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273808))) (currentByte!8860 (_2!8308 lt!273808)) (currentBit!8855 (_2!8308 lt!273808))) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273860))) (currentByte!8860 (_2!8308 lt!273860)) (currentBit!8855 (_2!8308 lt!273860))))))))

(declare-fun lt!273851 () Unit!12803)

(declare-fun Unit!12823 () Unit!12803)

(assert (=> b!178107 (= lt!273851 Unit!12823)))

(assert (=> b!178107 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) (bvsub (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273808))) (currentByte!8860 (_2!8308 lt!273808)) (currentBit!8855 (_2!8308 lt!273808))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!273827 () Unit!12803)

(declare-fun Unit!12824 () Unit!12803)

(assert (=> b!178107 (= lt!273827 Unit!12824)))

(assert (=> b!178107 (= (_2!8319 lt!273847) (_2!8319 lt!273822))))

(declare-fun lt!273855 () Unit!12803)

(declare-fun Unit!12825 () Unit!12803)

(assert (=> b!178107 (= lt!273855 Unit!12825)))

(assert (=> b!178107 (invariant!0 (currentBit!8855 (_2!8308 lt!273860)) (currentByte!8860 (_2!8308 lt!273860)) (size!4228 (buf!4671 (_2!8308 lt!273860))))))

(declare-fun lt!273805 () Unit!12803)

(declare-fun Unit!12826 () Unit!12803)

(assert (=> b!178107 (= lt!273805 Unit!12826)))

(assert (=> b!178107 (= (size!4228 (buf!4671 (_2!8308 lt!273210))) (size!4228 (buf!4671 (_2!8308 lt!273860))))))

(declare-fun lt!273859 () Unit!12803)

(declare-fun Unit!12827 () Unit!12803)

(assert (=> b!178107 (= lt!273859 Unit!12827)))

(assert (=> b!178107 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273860))) (currentByte!8860 (_2!8308 lt!273860)) (currentBit!8855 (_2!8308 lt!273860))) (bvsub (bvadd (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273812 () Unit!12803)

(declare-fun Unit!12828 () Unit!12803)

(assert (=> b!178107 (= lt!273812 Unit!12828)))

(declare-fun lt!273815 () Unit!12803)

(declare-fun Unit!12830 () Unit!12803)

(assert (=> b!178107 (= lt!273815 Unit!12830)))

(assert (=> b!178107 (= lt!273841 (reader!0 (_2!8308 lt!273210) (_2!8308 lt!273860)))))

(declare-fun lt!273816 () (_ BitVec 64))

(assert (=> b!178107 (= lt!273816 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!273818 () Unit!12803)

(assert (=> b!178107 (= lt!273818 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8308 lt!273210) (buf!4671 (_2!8308 lt!273860)) lt!273816))))

(assert (=> b!178107 (validate_offset_bits!1 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273860)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210))) lt!273816)))

(declare-fun lt!273846 () Unit!12803)

(assert (=> b!178107 (= lt!273846 lt!273818)))

(assert (=> b!178107 (= lt!273840 (readNBitsLSBFirstsLoopPure!0 (_1!8320 lt!273841) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!147668 () Bool)

(assert (=> b!178107 (= res!147668 (= (_2!8319 lt!273840) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!178107 (=> (not res!147668) (not e!124049))))

(assert (=> b!178107 e!124049))

(declare-fun lt!273826 () Unit!12803)

(declare-fun Unit!12833 () Unit!12803)

(assert (=> b!178107 (= lt!273826 Unit!12833)))

(declare-fun b!178108 () Bool)

(declare-fun e!124053 () Bool)

(declare-fun lt!273843 () tuple2!15328)

(assert (=> b!178108 (= e!124053 (= (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273843))) (currentByte!8860 (_1!8309 lt!273843)) (currentBit!8855 (_1!8309 lt!273843))) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273830))) (currentByte!8860 (_2!8308 lt!273830)) (currentBit!8855 (_2!8308 lt!273830)))))))

(declare-fun b!178109 () Bool)

(declare-fun res!147669 () Bool)

(assert (=> b!178109 (= res!147669 (isPrefixOf!0 (_2!8308 lt!273210) (_2!8308 lt!273830)))))

(assert (=> b!178109 (=> (not res!147669) (not e!124050))))

(declare-fun b!178110 () Bool)

(declare-fun Unit!12836 () Unit!12803)

(assert (=> b!178110 (= e!124046 (tuple2!15327 Unit!12836 (_2!8308 lt!273210)))))

(declare-fun lt!273857 () Unit!12803)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7564) Unit!12803)

(assert (=> b!178110 (= lt!273857 (lemmaIsPrefixRefl!0 (_2!8308 lt!273210)))))

(assert (=> b!178110 call!2927))

(declare-fun lt!273837 () Unit!12803)

(assert (=> b!178110 (= lt!273837 lt!273857)))

(declare-fun bm!2924 () Bool)

(assert (=> bm!2924 (= call!2927 (isPrefixOf!0 (_2!8308 lt!273210) (ite c!9275 (_2!8308 lt!273210) (_2!8308 lt!273860))))))

(declare-fun b!178111 () Bool)

(assert (=> b!178111 (= lt!273843 (readBitPure!0 (readerFrom!0 (_2!8308 lt!273830) (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)))))))

(declare-fun res!147671 () Bool)

(assert (=> b!178111 (= res!147671 (and (= (_2!8309 lt!273843) lt!273825) (= (_1!8309 lt!273843) (_2!8308 lt!273830))))))

(assert (=> b!178111 (=> (not res!147671) (not e!124053))))

(assert (=> b!178111 (= e!124050 e!124053)))

(assert (= (and d!62561 c!9275) b!178110))

(assert (= (and d!62561 (not c!9275)) b!178107))

(assert (= (and b!178107 res!147675) b!178105))

(assert (= (and b!178105 res!147676) b!178109))

(assert (= (and b!178109 res!147669) b!178111))

(assert (= (and b!178111 res!147671) b!178108))

(assert (= (and b!178107 res!147677) b!178099))

(assert (= (and b!178107 c!9276) b!178097))

(assert (= (and b!178107 (not c!9276)) b!178101))

(assert (= (and b!178107 res!147668) b!178102))

(assert (= (or b!178110 b!178107) bm!2924))

(assert (= (and d!62561 res!147667) b!178100))

(assert (= (and b!178100 res!147673) b!178098))

(assert (= (and b!178098 res!147672) b!178104))

(assert (= (and b!178104 res!147674) b!178106))

(assert (= (and b!178106 res!147666) b!178103))

(assert (= (and b!178106 res!147670) b!178096))

(declare-fun m!278195 () Bool)

(assert (=> b!178108 m!278195))

(declare-fun m!278197 () Bool)

(assert (=> b!178108 m!278197))

(declare-fun m!278199 () Bool)

(assert (=> b!178107 m!278199))

(declare-fun m!278201 () Bool)

(assert (=> b!178107 m!278201))

(declare-fun m!278203 () Bool)

(assert (=> b!178107 m!278203))

(declare-fun m!278205 () Bool)

(assert (=> b!178107 m!278205))

(declare-fun m!278207 () Bool)

(assert (=> b!178107 m!278207))

(declare-fun m!278209 () Bool)

(assert (=> b!178107 m!278209))

(declare-fun m!278211 () Bool)

(assert (=> b!178107 m!278211))

(declare-fun m!278213 () Bool)

(assert (=> b!178107 m!278213))

(declare-fun m!278215 () Bool)

(assert (=> b!178107 m!278215))

(declare-fun m!278217 () Bool)

(assert (=> b!178107 m!278217))

(assert (=> b!178107 m!277839))

(declare-fun m!278219 () Bool)

(assert (=> b!178107 m!278219))

(declare-fun m!278221 () Bool)

(assert (=> b!178107 m!278221))

(declare-fun m!278223 () Bool)

(assert (=> b!178107 m!278223))

(declare-fun m!278225 () Bool)

(assert (=> b!178107 m!278225))

(declare-fun m!278227 () Bool)

(assert (=> b!178107 m!278227))

(declare-fun m!278229 () Bool)

(assert (=> b!178107 m!278229))

(assert (=> b!178107 m!278207))

(declare-fun m!278231 () Bool)

(assert (=> b!178107 m!278231))

(declare-fun m!278233 () Bool)

(assert (=> b!178107 m!278233))

(declare-fun m!278235 () Bool)

(assert (=> b!178107 m!278235))

(declare-fun m!278237 () Bool)

(assert (=> b!178107 m!278237))

(declare-fun m!278239 () Bool)

(assert (=> b!178107 m!278239))

(declare-fun m!278241 () Bool)

(assert (=> b!178107 m!278241))

(declare-fun m!278243 () Bool)

(assert (=> b!178107 m!278243))

(declare-fun m!278245 () Bool)

(assert (=> b!178107 m!278245))

(declare-fun m!278247 () Bool)

(assert (=> b!178107 m!278247))

(declare-fun m!278249 () Bool)

(assert (=> b!178107 m!278249))

(declare-fun m!278251 () Bool)

(assert (=> b!178107 m!278251))

(declare-fun m!278253 () Bool)

(assert (=> b!178107 m!278253))

(declare-fun m!278255 () Bool)

(assert (=> b!178107 m!278255))

(declare-fun m!278257 () Bool)

(assert (=> b!178107 m!278257))

(declare-fun m!278259 () Bool)

(assert (=> b!178107 m!278259))

(declare-fun m!278261 () Bool)

(assert (=> b!178107 m!278261))

(declare-fun m!278263 () Bool)

(assert (=> b!178111 m!278263))

(assert (=> b!178111 m!278263))

(declare-fun m!278265 () Bool)

(assert (=> b!178111 m!278265))

(declare-fun m!278267 () Bool)

(assert (=> b!178103 m!278267))

(declare-fun m!278269 () Bool)

(assert (=> bm!2924 m!278269))

(declare-fun m!278271 () Bool)

(assert (=> b!178104 m!278271))

(declare-fun m!278273 () Bool)

(assert (=> b!178098 m!278273))

(assert (=> b!178098 m!277839))

(declare-fun m!278275 () Bool)

(assert (=> b!178109 m!278275))

(assert (=> b!178105 m!278197))

(assert (=> b!178105 m!277839))

(declare-fun m!278277 () Bool)

(assert (=> d!62561 m!278277))

(declare-fun m!278279 () Bool)

(assert (=> b!178110 m!278279))

(assert (=> b!178106 m!278201))

(declare-fun m!278281 () Bool)

(assert (=> b!178106 m!278281))

(declare-fun m!278283 () Bool)

(assert (=> b!178106 m!278283))

(declare-fun m!278285 () Bool)

(assert (=> b!178106 m!278285))

(declare-fun m!278287 () Bool)

(assert (=> b!178106 m!278287))

(assert (=> b!178106 m!278257))

(assert (=> b!177813 d!62561))

(declare-fun d!62611 () Bool)

(assert (=> d!62611 (= (invariant!0 (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204))) (and (bvsge (currentBit!8855 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8855 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8860 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204))) (and (= (currentBit!8855 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204)))))))))

(assert (=> b!177819 d!62611))

(declare-fun d!62613 () Bool)

(assert (=> d!62613 (= (array_inv!3969 (buf!4671 thiss!1204)) (bvsge (size!4228 (buf!4671 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!177814 d!62613))

(declare-fun d!62615 () Bool)

(declare-fun e!124056 () Bool)

(assert (=> d!62615 e!124056))

(declare-fun res!147683 () Bool)

(assert (=> d!62615 (=> (not res!147683) (not e!124056))))

(declare-fun lt!273874 () (_ BitVec 64))

(declare-fun lt!273873 () (_ BitVec 64))

(declare-fun lt!273876 () (_ BitVec 64))

(assert (=> d!62615 (= res!147683 (= lt!273874 (bvsub lt!273876 lt!273873)))))

(assert (=> d!62615 (or (= (bvand lt!273876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273876 lt!273873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62615 (= lt!273873 (remainingBits!0 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273210)))) ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210)))))))

(declare-fun lt!273875 () (_ BitVec 64))

(declare-fun lt!273878 () (_ BitVec 64))

(assert (=> d!62615 (= lt!273876 (bvmul lt!273875 lt!273878))))

(assert (=> d!62615 (or (= lt!273875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273878 (bvsdiv (bvmul lt!273875 lt!273878) lt!273875)))))

(assert (=> d!62615 (= lt!273878 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62615 (= lt!273875 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(assert (=> d!62615 (= lt!273874 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8860 (_2!8308 lt!273210))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8855 (_2!8308 lt!273210)))))))

(assert (=> d!62615 (invariant!0 (currentBit!8855 (_2!8308 lt!273210)) (currentByte!8860 (_2!8308 lt!273210)) (size!4228 (buf!4671 (_2!8308 lt!273210))))))

(assert (=> d!62615 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210))) lt!273874)))

(declare-fun b!178116 () Bool)

(declare-fun res!147682 () Bool)

(assert (=> b!178116 (=> (not res!147682) (not e!124056))))

(assert (=> b!178116 (= res!147682 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273874))))

(declare-fun b!178117 () Bool)

(declare-fun lt!273877 () (_ BitVec 64))

(assert (=> b!178117 (= e!124056 (bvsle lt!273874 (bvmul lt!273877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!178117 (or (= lt!273877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273877)))))

(assert (=> b!178117 (= lt!273877 ((_ sign_extend 32) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(assert (= (and d!62615 res!147683) b!178116))

(assert (= (and b!178116 res!147682) b!178117))

(declare-fun m!278289 () Bool)

(assert (=> d!62615 m!278289))

(assert (=> d!62615 m!277847))

(assert (=> b!177815 d!62615))

(declare-fun d!62617 () Bool)

(declare-fun e!124057 () Bool)

(assert (=> d!62617 e!124057))

(declare-fun res!147685 () Bool)

(assert (=> d!62617 (=> (not res!147685) (not e!124057))))

(declare-fun lt!273880 () (_ BitVec 64))

(declare-fun lt!273879 () (_ BitVec 64))

(declare-fun lt!273882 () (_ BitVec 64))

(assert (=> d!62617 (= res!147685 (= lt!273880 (bvsub lt!273882 lt!273879)))))

(assert (=> d!62617 (or (= (bvand lt!273882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273882 lt!273879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62617 (= lt!273879 (remainingBits!0 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))) ((_ sign_extend 32) (currentByte!8860 thiss!1204)) ((_ sign_extend 32) (currentBit!8855 thiss!1204))))))

(declare-fun lt!273881 () (_ BitVec 64))

(declare-fun lt!273884 () (_ BitVec 64))

(assert (=> d!62617 (= lt!273882 (bvmul lt!273881 lt!273884))))

(assert (=> d!62617 (or (= lt!273881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273884 (bvsdiv (bvmul lt!273881 lt!273884) lt!273881)))))

(assert (=> d!62617 (= lt!273884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62617 (= lt!273881 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))))))

(assert (=> d!62617 (= lt!273880 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8860 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8855 thiss!1204))))))

(assert (=> d!62617 (invariant!0 (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204)))))

(assert (=> d!62617 (= (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)) lt!273880)))

(declare-fun b!178118 () Bool)

(declare-fun res!147684 () Bool)

(assert (=> b!178118 (=> (not res!147684) (not e!124057))))

(assert (=> b!178118 (= res!147684 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273880))))

(declare-fun b!178119 () Bool)

(declare-fun lt!273883 () (_ BitVec 64))

(assert (=> b!178119 (= e!124057 (bvsle lt!273880 (bvmul lt!273883 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!178119 (or (= lt!273883 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273883 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273883)))))

(assert (=> b!178119 (= lt!273883 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))))))

(assert (= (and d!62617 res!147685) b!178118))

(assert (= (and b!178118 res!147684) b!178119))

(assert (=> d!62617 m!277933))

(assert (=> d!62617 m!277863))

(assert (=> b!177815 d!62617))

(declare-fun d!62619 () Bool)

(declare-fun e!124062 () Bool)

(assert (=> d!62619 e!124062))

(declare-fun res!147696 () Bool)

(assert (=> d!62619 (=> (not res!147696) (not e!124062))))

(declare-fun lt!273893 () tuple2!15326)

(assert (=> d!62619 (= res!147696 (= (size!4228 (buf!4671 thiss!1204)) (size!4228 (buf!4671 (_2!8308 lt!273893)))))))

(declare-fun choose!16 (BitStream!7564 Bool) tuple2!15326)

(assert (=> d!62619 (= lt!273893 (choose!16 thiss!1204 lt!273206))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62619 (validate_offset_bit!0 ((_ sign_extend 32) (size!4228 (buf!4671 thiss!1204))) ((_ sign_extend 32) (currentByte!8860 thiss!1204)) ((_ sign_extend 32) (currentBit!8855 thiss!1204)))))

(assert (=> d!62619 (= (appendBit!0 thiss!1204 lt!273206) lt!273893)))

(declare-fun b!178130 () Bool)

(declare-fun res!147697 () Bool)

(assert (=> b!178130 (=> (not res!147697) (not e!124062))))

(assert (=> b!178130 (= res!147697 (isPrefixOf!0 thiss!1204 (_2!8308 lt!273893)))))

(declare-fun b!178131 () Bool)

(declare-fun e!124063 () Bool)

(assert (=> b!178131 (= e!124062 e!124063)))

(declare-fun res!147695 () Bool)

(assert (=> b!178131 (=> (not res!147695) (not e!124063))))

(declare-fun lt!273896 () tuple2!15328)

(assert (=> b!178131 (= res!147695 (and (= (_2!8309 lt!273896) lt!273206) (= (_1!8309 lt!273896) (_2!8308 lt!273893))))))

(assert (=> b!178131 (= lt!273896 (readBitPure!0 (readerFrom!0 (_2!8308 lt!273893) (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204))))))

(declare-fun b!178132 () Bool)

(assert (=> b!178132 (= e!124063 (= (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273896))) (currentByte!8860 (_1!8309 lt!273896)) (currentBit!8855 (_1!8309 lt!273896))) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273893))) (currentByte!8860 (_2!8308 lt!273893)) (currentBit!8855 (_2!8308 lt!273893)))))))

(declare-fun b!178129 () Bool)

(declare-fun res!147694 () Bool)

(assert (=> b!178129 (=> (not res!147694) (not e!124062))))

(declare-fun lt!273894 () (_ BitVec 64))

(declare-fun lt!273895 () (_ BitVec 64))

(assert (=> b!178129 (= res!147694 (= (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273893))) (currentByte!8860 (_2!8308 lt!273893)) (currentBit!8855 (_2!8308 lt!273893))) (bvadd lt!273895 lt!273894)))))

(assert (=> b!178129 (or (not (= (bvand lt!273895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273894 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!273895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!273895 lt!273894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178129 (= lt!273894 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!178129 (= lt!273895 (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)))))

(assert (= (and d!62619 res!147696) b!178129))

(assert (= (and b!178129 res!147694) b!178130))

(assert (= (and b!178130 res!147697) b!178131))

(assert (= (and b!178131 res!147695) b!178132))

(declare-fun m!278291 () Bool)

(assert (=> b!178129 m!278291))

(assert (=> b!178129 m!277841))

(declare-fun m!278293 () Bool)

(assert (=> d!62619 m!278293))

(declare-fun m!278295 () Bool)

(assert (=> d!62619 m!278295))

(declare-fun m!278297 () Bool)

(assert (=> b!178130 m!278297))

(declare-fun m!278299 () Bool)

(assert (=> b!178132 m!278299))

(assert (=> b!178132 m!278291))

(declare-fun m!278301 () Bool)

(assert (=> b!178131 m!278301))

(assert (=> b!178131 m!278301))

(declare-fun m!278303 () Bool)

(assert (=> b!178131 m!278303))

(assert (=> b!177815 d!62619))

(assert (=> b!177810 d!62615))

(assert (=> b!177810 d!62617))

(declare-fun d!62621 () Bool)

(declare-fun res!147698 () Bool)

(declare-fun e!124065 () Bool)

(assert (=> d!62621 (=> (not res!147698) (not e!124065))))

(assert (=> d!62621 (= res!147698 (= (size!4228 (buf!4671 thiss!1204)) (size!4228 (buf!4671 (_2!8308 lt!273210)))))))

(assert (=> d!62621 (= (isPrefixOf!0 thiss!1204 (_2!8308 lt!273210)) e!124065)))

(declare-fun b!178133 () Bool)

(declare-fun res!147700 () Bool)

(assert (=> b!178133 (=> (not res!147700) (not e!124065))))

(assert (=> b!178133 (= res!147700 (bvsle (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204)) (bitIndex!0 (size!4228 (buf!4671 (_2!8308 lt!273210))) (currentByte!8860 (_2!8308 lt!273210)) (currentBit!8855 (_2!8308 lt!273210)))))))

(declare-fun b!178134 () Bool)

(declare-fun e!124064 () Bool)

(assert (=> b!178134 (= e!124065 e!124064)))

(declare-fun res!147699 () Bool)

(assert (=> b!178134 (=> res!147699 e!124064)))

(assert (=> b!178134 (= res!147699 (= (size!4228 (buf!4671 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!178135 () Bool)

(assert (=> b!178135 (= e!124064 (arrayBitRangesEq!0 (buf!4671 thiss!1204) (buf!4671 (_2!8308 lt!273210)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4228 (buf!4671 thiss!1204)) (currentByte!8860 thiss!1204) (currentBit!8855 thiss!1204))))))

(assert (= (and d!62621 res!147698) b!178133))

(assert (= (and b!178133 res!147700) b!178134))

(assert (= (and b!178134 (not res!147699)) b!178135))

(assert (=> b!178133 m!277841))

(assert (=> b!178133 m!277839))

(assert (=> b!178135 m!277841))

(assert (=> b!178135 m!277841))

(declare-fun m!278305 () Bool)

(assert (=> b!178135 m!278305))

(assert (=> b!177816 d!62621))

(declare-fun d!62623 () Bool)

(assert (=> d!62623 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8855 thiss!1204) (currentByte!8860 thiss!1204) (size!4228 (buf!4671 thiss!1204))))))

(declare-fun bs!15603 () Bool)

(assert (= bs!15603 d!62623))

(assert (=> bs!15603 m!277863))

(assert (=> start!39512 d!62623))

(declare-fun d!62625 () Bool)

(declare-fun e!124066 () Bool)

(assert (=> d!62625 e!124066))

(declare-fun res!147702 () Bool)

(assert (=> d!62625 (=> (not res!147702) (not e!124066))))

(declare-fun lt!273898 () (_ BitVec 64))

(declare-fun lt!273900 () (_ BitVec 64))

(declare-fun lt!273897 () (_ BitVec 64))

(assert (=> d!62625 (= res!147702 (= lt!273898 (bvsub lt!273900 lt!273897)))))

(assert (=> d!62625 (or (= (bvand lt!273900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!273900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!273900 lt!273897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62625 (= lt!273897 (remainingBits!0 ((_ sign_extend 32) (size!4228 (buf!4671 (_1!8309 lt!273209)))) ((_ sign_extend 32) (currentByte!8860 (_1!8309 lt!273209))) ((_ sign_extend 32) (currentBit!8855 (_1!8309 lt!273209)))))))

(declare-fun lt!273899 () (_ BitVec 64))

(declare-fun lt!273902 () (_ BitVec 64))

(assert (=> d!62625 (= lt!273900 (bvmul lt!273899 lt!273902))))

(assert (=> d!62625 (or (= lt!273899 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!273902 (bvsdiv (bvmul lt!273899 lt!273902) lt!273899)))))

(assert (=> d!62625 (= lt!273902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62625 (= lt!273899 ((_ sign_extend 32) (size!4228 (buf!4671 (_1!8309 lt!273209)))))))

(assert (=> d!62625 (= lt!273898 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8860 (_1!8309 lt!273209))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8855 (_1!8309 lt!273209)))))))

(assert (=> d!62625 (invariant!0 (currentBit!8855 (_1!8309 lt!273209)) (currentByte!8860 (_1!8309 lt!273209)) (size!4228 (buf!4671 (_1!8309 lt!273209))))))

(assert (=> d!62625 (= (bitIndex!0 (size!4228 (buf!4671 (_1!8309 lt!273209))) (currentByte!8860 (_1!8309 lt!273209)) (currentBit!8855 (_1!8309 lt!273209))) lt!273898)))

(declare-fun b!178136 () Bool)

(declare-fun res!147701 () Bool)

(assert (=> b!178136 (=> (not res!147701) (not e!124066))))

(assert (=> b!178136 (= res!147701 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!273898))))

(declare-fun b!178137 () Bool)

(declare-fun lt!273901 () (_ BitVec 64))

(assert (=> b!178137 (= e!124066 (bvsle lt!273898 (bvmul lt!273901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!178137 (or (= lt!273901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!273901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!273901)))))

(assert (=> b!178137 (= lt!273901 ((_ sign_extend 32) (size!4228 (buf!4671 (_1!8309 lt!273209)))))))

(assert (= (and d!62625 res!147702) b!178136))

(assert (= (and b!178136 res!147701) b!178137))

(declare-fun m!278307 () Bool)

(assert (=> d!62625 m!278307))

(declare-fun m!278309 () Bool)

(assert (=> d!62625 m!278309))

(assert (=> b!177811 d!62625))

(push 1)

(assert (not b!178107))

(assert (not d!62551))

(assert (not b!177898))

(assert (not d!62559))

(assert (not b!178109))

(assert (not b!178131))

(assert (not d!62625))

(assert (not b!178106))

(assert (not d!62553))

(assert (not b!178098))

(assert (not d!62549))

(assert (not d!62623))

(assert (not d!62617))

(assert (not d!62615))

(assert (not b!177891))

(assert (not b!178129))

(assert (not b!178111))

(assert (not b!178105))

(assert (not b!177900))

(assert (not b!178132))

(assert (not d!62619))

(assert (not b!178110))

(assert (not b!178135))

(assert (not b!178103))

(assert (not b!178104))

(assert (not b!178108))

(assert (not b!178133))

(assert (not bm!2924))

(assert (not d!62561))

(assert (not b!178130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

