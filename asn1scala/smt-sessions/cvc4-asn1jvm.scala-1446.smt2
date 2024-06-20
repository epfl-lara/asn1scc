; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39630 () Bool)

(assert start!39630)

(declare-fun b!179246 () Bool)

(declare-fun res!148751 () Bool)

(declare-fun e!124696 () Bool)

(assert (=> b!179246 (=> res!148751 e!124696)))

(declare-datatypes ((array!9645 0))(
  ( (array!9646 (arr!5184 (Array (_ BitVec 32) (_ BitVec 8))) (size!4254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7616 0))(
  ( (BitStream!7617 (buf!4697 array!9645) (currentByte!8895 (_ BitVec 32)) (currentBit!8890 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7616)

(declare-datatypes ((Unit!12888 0))(
  ( (Unit!12889) )
))
(declare-datatypes ((tuple2!15458 0))(
  ( (tuple2!15459 (_1!8374 Unit!12888) (_2!8374 BitStream!7616)) )
))
(declare-fun lt!274772 () tuple2!15458)

(declare-fun isPrefixOf!0 (BitStream!7616 BitStream!7616) Bool)

(assert (=> b!179246 (= res!148751 (not (isPrefixOf!0 thiss!1204 (_2!8374 lt!274772))))))

(declare-fun b!179247 () Bool)

(declare-fun e!124698 () Bool)

(declare-fun lt!274770 () tuple2!15458)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179247 (= e!124698 (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274770)))))))

(declare-fun b!179248 () Bool)

(declare-fun e!124703 () Bool)

(declare-fun array_inv!3995 (array!9645) Bool)

(assert (=> b!179248 (= e!124703 (array_inv!3995 (buf!4697 thiss!1204)))))

(declare-fun b!179249 () Bool)

(declare-datatypes ((tuple2!15460 0))(
  ( (tuple2!15461 (_1!8375 BitStream!7616) (_2!8375 BitStream!7616)) )
))
(declare-fun lt!274771 () tuple2!15460)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179249 (= e!124696 (validate_offset_bit!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8375 lt!274771)))) ((_ sign_extend 32) (currentByte!8895 (_1!8375 lt!274771))) ((_ sign_extend 32) (currentBit!8890 (_1!8375 lt!274771)))))))

(declare-fun lt!274775 () tuple2!15460)

(declare-fun reader!0 (BitStream!7616 BitStream!7616) tuple2!15460)

(assert (=> b!179249 (= lt!274775 (reader!0 (_2!8374 lt!274772) (_2!8374 lt!274770)))))

(assert (=> b!179249 (= lt!274771 (reader!0 thiss!1204 (_2!8374 lt!274770)))))

(declare-fun e!124697 () Bool)

(assert (=> b!179249 e!124697))

(declare-fun res!148753 () Bool)

(assert (=> b!179249 (=> (not res!148753) (not e!124697))))

(declare-datatypes ((tuple2!15462 0))(
  ( (tuple2!15463 (_1!8376 BitStream!7616) (_2!8376 Bool)) )
))
(declare-fun lt!274763 () tuple2!15462)

(declare-fun lt!274773 () tuple2!15462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179249 (= res!148753 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274763))) (currentByte!8895 (_1!8376 lt!274763)) (currentBit!8890 (_1!8376 lt!274763))) (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274773))) (currentByte!8895 (_1!8376 lt!274773)) (currentBit!8890 (_1!8376 lt!274773)))))))

(declare-fun lt!274774 () Unit!12888)

(declare-fun lt!274767 () BitStream!7616)

(declare-fun readBitPrefixLemma!0 (BitStream!7616 BitStream!7616) Unit!12888)

(assert (=> b!179249 (= lt!274774 (readBitPrefixLemma!0 lt!274767 (_2!8374 lt!274770)))))

(declare-fun readBitPure!0 (BitStream!7616) tuple2!15462)

(assert (=> b!179249 (= lt!274773 (readBitPure!0 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204))))))

(assert (=> b!179249 (= lt!274763 (readBitPure!0 lt!274767))))

(assert (=> b!179249 e!124698))

(declare-fun res!148752 () Bool)

(assert (=> b!179249 (=> (not res!148752) (not e!124698))))

(assert (=> b!179249 (= res!148752 (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (=> b!179249 (= lt!274767 (BitStream!7617 (buf!4697 (_2!8374 lt!274772)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun res!148743 () Bool)

(declare-fun e!124699 () Bool)

(assert (=> start!39630 (=> (not res!148743) (not e!124699))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39630 (= res!148743 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39630 e!124699))

(assert (=> start!39630 true))

(declare-fun inv!12 (BitStream!7616) Bool)

(assert (=> start!39630 (and (inv!12 thiss!1204) e!124703)))

(declare-fun b!179250 () Bool)

(declare-fun res!148750 () Bool)

(assert (=> b!179250 (=> (not res!148750) (not e!124699))))

(assert (=> b!179250 (= res!148750 (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204))))))

(declare-fun b!179251 () Bool)

(declare-fun e!124702 () Bool)

(declare-fun lt!274768 () tuple2!15462)

(declare-fun lt!274762 () (_ BitVec 64))

(assert (=> b!179251 (= e!124702 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274768))) (currentByte!8895 (_1!8376 lt!274768)) (currentBit!8890 (_1!8376 lt!274768))) lt!274762))))

(declare-fun b!179252 () Bool)

(declare-fun e!124701 () Bool)

(assert (=> b!179252 (= e!124701 e!124696)))

(declare-fun res!148748 () Bool)

(assert (=> b!179252 (=> res!148748 e!124696)))

(declare-fun lt!274765 () (_ BitVec 64))

(declare-fun lt!274766 () (_ BitVec 64))

(assert (=> b!179252 (= res!148748 (not (= lt!274765 (bvsub (bvsub (bvadd lt!274766 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179252 (= lt!274765 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770))))))

(assert (=> b!179252 (isPrefixOf!0 thiss!1204 (_2!8374 lt!274770))))

(declare-fun lt!274764 () Unit!12888)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7616 BitStream!7616 BitStream!7616) Unit!12888)

(assert (=> b!179252 (= lt!274764 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8374 lt!274772) (_2!8374 lt!274770)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15458)

(assert (=> b!179252 (= lt!274770 (appendBitsLSBFirstLoopTR!0 (_2!8374 lt!274772) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179253 () Bool)

(declare-fun res!148746 () Bool)

(assert (=> b!179253 (=> res!148746 e!124696)))

(assert (=> b!179253 (= res!148746 (not (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!274770))))))

(declare-fun b!179254 () Bool)

(assert (=> b!179254 (= e!124697 (= (_2!8376 lt!274763) (_2!8376 lt!274773)))))

(declare-fun b!179255 () Bool)

(declare-fun res!148742 () Bool)

(assert (=> b!179255 (=> res!148742 e!124696)))

(declare-fun lt!274769 () (_ BitVec 64))

(assert (=> b!179255 (= res!148742 (or (not (= (size!4254 (buf!4697 (_2!8374 lt!274770))) (size!4254 (buf!4697 thiss!1204)))) (not (= lt!274765 (bvsub (bvadd lt!274769 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179256 () Bool)

(declare-fun res!148755 () Bool)

(assert (=> b!179256 (=> res!148755 e!124696)))

(assert (=> b!179256 (= res!148755 (not (invariant!0 (currentBit!8890 (_2!8374 lt!274770)) (currentByte!8895 (_2!8374 lt!274770)) (size!4254 (buf!4697 (_2!8374 lt!274770))))))))

(declare-fun b!179257 () Bool)

(assert (=> b!179257 (= e!124699 (not e!124701))))

(declare-fun res!148747 () Bool)

(assert (=> b!179257 (=> res!148747 e!124701)))

(assert (=> b!179257 (= res!148747 (not (= lt!274766 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274769))))))

(assert (=> b!179257 (= lt!274766 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(assert (=> b!179257 (= lt!274769 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun e!124700 () Bool)

(assert (=> b!179257 e!124700))

(declare-fun res!148745 () Bool)

(assert (=> b!179257 (=> (not res!148745) (not e!124700))))

(assert (=> b!179257 (= res!148745 (= (size!4254 (buf!4697 thiss!1204)) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(declare-fun lt!274761 () Bool)

(declare-fun appendBit!0 (BitStream!7616 Bool) tuple2!15458)

(assert (=> b!179257 (= lt!274772 (appendBit!0 thiss!1204 lt!274761))))

(assert (=> b!179257 (= lt!274761 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179258 () Bool)

(declare-fun res!148754 () Bool)

(assert (=> b!179258 (=> (not res!148754) (not e!124699))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179258 (= res!148754 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))) ((_ sign_extend 32) (currentByte!8895 thiss!1204)) ((_ sign_extend 32) (currentBit!8890 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179259 () Bool)

(declare-fun res!148741 () Bool)

(assert (=> b!179259 (=> (not res!148741) (not e!124699))))

(assert (=> b!179259 (= res!148741 (not (= i!590 nBits!348)))))

(declare-fun b!179260 () Bool)

(declare-fun e!124704 () Bool)

(assert (=> b!179260 (= e!124704 e!124702)))

(declare-fun res!148744 () Bool)

(assert (=> b!179260 (=> (not res!148744) (not e!124702))))

(assert (=> b!179260 (= res!148744 (and (= (_2!8376 lt!274768) lt!274761) (= (_1!8376 lt!274768) (_2!8374 lt!274772))))))

(declare-fun readerFrom!0 (BitStream!7616 (_ BitVec 32) (_ BitVec 32)) BitStream!7616)

(assert (=> b!179260 (= lt!274768 (readBitPure!0 (readerFrom!0 (_2!8374 lt!274772) (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204))))))

(declare-fun b!179261 () Bool)

(assert (=> b!179261 (= e!124700 e!124704)))

(declare-fun res!148740 () Bool)

(assert (=> b!179261 (=> (not res!148740) (not e!124704))))

(declare-fun lt!274760 () (_ BitVec 64))

(assert (=> b!179261 (= res!148740 (= lt!274762 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274760)))))

(assert (=> b!179261 (= lt!274762 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(assert (=> b!179261 (= lt!274760 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun b!179262 () Bool)

(declare-fun res!148749 () Bool)

(assert (=> b!179262 (=> (not res!148749) (not e!124704))))

(assert (=> b!179262 (= res!148749 (isPrefixOf!0 thiss!1204 (_2!8374 lt!274772)))))

(assert (= (and start!39630 res!148743) b!179258))

(assert (= (and b!179258 res!148754) b!179250))

(assert (= (and b!179250 res!148750) b!179259))

(assert (= (and b!179259 res!148741) b!179257))

(assert (= (and b!179257 res!148745) b!179261))

(assert (= (and b!179261 res!148740) b!179262))

(assert (= (and b!179262 res!148749) b!179260))

(assert (= (and b!179260 res!148744) b!179251))

(assert (= (and b!179257 (not res!148747)) b!179252))

(assert (= (and b!179252 (not res!148748)) b!179256))

(assert (= (and b!179256 (not res!148755)) b!179255))

(assert (= (and b!179255 (not res!148742)) b!179253))

(assert (= (and b!179253 (not res!148746)) b!179246))

(assert (= (and b!179246 (not res!148751)) b!179249))

(assert (= (and b!179249 res!148752) b!179247))

(assert (= (and b!179249 res!148753) b!179254))

(assert (= start!39630 b!179248))

(declare-fun m!279325 () Bool)

(assert (=> b!179248 m!279325))

(declare-fun m!279327 () Bool)

(assert (=> b!179257 m!279327))

(declare-fun m!279329 () Bool)

(assert (=> b!179257 m!279329))

(declare-fun m!279331 () Bool)

(assert (=> b!179257 m!279331))

(declare-fun m!279333 () Bool)

(assert (=> b!179260 m!279333))

(assert (=> b!179260 m!279333))

(declare-fun m!279335 () Bool)

(assert (=> b!179260 m!279335))

(declare-fun m!279337 () Bool)

(assert (=> b!179262 m!279337))

(declare-fun m!279339 () Bool)

(assert (=> b!179249 m!279339))

(declare-fun m!279341 () Bool)

(assert (=> b!179249 m!279341))

(declare-fun m!279343 () Bool)

(assert (=> b!179249 m!279343))

(declare-fun m!279345 () Bool)

(assert (=> b!179249 m!279345))

(declare-fun m!279347 () Bool)

(assert (=> b!179249 m!279347))

(declare-fun m!279349 () Bool)

(assert (=> b!179249 m!279349))

(declare-fun m!279351 () Bool)

(assert (=> b!179249 m!279351))

(declare-fun m!279353 () Bool)

(assert (=> b!179249 m!279353))

(declare-fun m!279355 () Bool)

(assert (=> b!179249 m!279355))

(assert (=> b!179246 m!279337))

(assert (=> b!179261 m!279327))

(assert (=> b!179261 m!279329))

(declare-fun m!279357 () Bool)

(assert (=> b!179253 m!279357))

(declare-fun m!279359 () Bool)

(assert (=> b!179251 m!279359))

(declare-fun m!279361 () Bool)

(assert (=> b!179250 m!279361))

(declare-fun m!279363 () Bool)

(assert (=> b!179252 m!279363))

(declare-fun m!279365 () Bool)

(assert (=> b!179252 m!279365))

(declare-fun m!279367 () Bool)

(assert (=> b!179252 m!279367))

(declare-fun m!279369 () Bool)

(assert (=> b!179252 m!279369))

(declare-fun m!279371 () Bool)

(assert (=> start!39630 m!279371))

(declare-fun m!279373 () Bool)

(assert (=> b!179258 m!279373))

(declare-fun m!279375 () Bool)

(assert (=> b!179247 m!279375))

(declare-fun m!279377 () Bool)

(assert (=> b!179256 m!279377))

(push 1)

(assert (not b!179260))

(assert (not b!179247))

(assert (not b!179253))

(assert (not b!179257))

(assert (not start!39630))

(assert (not b!179258))

(assert (not b!179249))

(assert (not b!179261))

(assert (not b!179262))

(assert (not b!179251))

(assert (not b!179252))

(assert (not b!179256))

(assert (not b!179250))

(assert (not b!179248))

(assert (not b!179246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62659 () Bool)

(assert (=> d!62659 (= (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274770)))) (and (bvsge (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8890 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8895 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274770)))) (and (= (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274770))))))))))

(assert (=> b!179247 d!62659))

(declare-fun d!62661 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62661 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))) ((_ sign_extend 32) (currentByte!8895 thiss!1204)) ((_ sign_extend 32) (currentBit!8890 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))) ((_ sign_extend 32) (currentByte!8895 thiss!1204)) ((_ sign_extend 32) (currentBit!8890 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15630 () Bool)

(assert (= bs!15630 d!62661))

(declare-fun m!279395 () Bool)

(assert (=> bs!15630 m!279395))

(assert (=> b!179258 d!62661))

(declare-fun d!62663 () Bool)

(assert (=> d!62663 (= (array_inv!3995 (buf!4697 thiss!1204)) (bvsge (size!4254 (buf!4697 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!179248 d!62663))

(declare-fun d!62665 () Bool)

(declare-fun e!124725 () Bool)

(assert (=> d!62665 e!124725))

(declare-fun res!148787 () Bool)

(assert (=> d!62665 (=> (not res!148787) (not e!124725))))

(declare-fun lt!274871 () tuple2!15462)

(declare-fun lt!274870 () tuple2!15462)

(assert (=> d!62665 (= res!148787 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274871))) (currentByte!8895 (_1!8376 lt!274871)) (currentBit!8890 (_1!8376 lt!274871))) (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274870))) (currentByte!8895 (_1!8376 lt!274870)) (currentBit!8890 (_1!8376 lt!274870)))))))

(declare-fun lt!274869 () BitStream!7616)

(declare-fun lt!274872 () Unit!12888)

(declare-fun choose!50 (BitStream!7616 BitStream!7616 BitStream!7616 tuple2!15462 tuple2!15462 BitStream!7616 Bool tuple2!15462 tuple2!15462 BitStream!7616 Bool) Unit!12888)

(assert (=> d!62665 (= lt!274872 (choose!50 lt!274767 (_2!8374 lt!274770) lt!274869 lt!274871 (tuple2!15463 (_1!8376 lt!274871) (_2!8376 lt!274871)) (_1!8376 lt!274871) (_2!8376 lt!274871) lt!274870 (tuple2!15463 (_1!8376 lt!274870) (_2!8376 lt!274870)) (_1!8376 lt!274870) (_2!8376 lt!274870)))))

(assert (=> d!62665 (= lt!274870 (readBitPure!0 lt!274869))))

(assert (=> d!62665 (= lt!274871 (readBitPure!0 lt!274767))))

(assert (=> d!62665 (= lt!274869 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 lt!274767) (currentBit!8890 lt!274767)))))

(assert (=> d!62665 (invariant!0 (currentBit!8890 lt!274767) (currentByte!8895 lt!274767) (size!4254 (buf!4697 (_2!8374 lt!274770))))))

(assert (=> d!62665 (= (readBitPrefixLemma!0 lt!274767 (_2!8374 lt!274770)) lt!274872)))

(declare-fun b!179298 () Bool)

(assert (=> b!179298 (= e!124725 (= (_2!8376 lt!274871) (_2!8376 lt!274870)))))

(assert (= (and d!62665 res!148787) b!179298))

(declare-fun m!279397 () Bool)

(assert (=> d!62665 m!279397))

(declare-fun m!279399 () Bool)

(assert (=> d!62665 m!279399))

(declare-fun m!279401 () Bool)

(assert (=> d!62665 m!279401))

(declare-fun m!279403 () Bool)

(assert (=> d!62665 m!279403))

(assert (=> d!62665 m!279349))

(declare-fun m!279405 () Bool)

(assert (=> d!62665 m!279405))

(assert (=> b!179249 d!62665))

(declare-fun d!62667 () Bool)

(assert (=> d!62667 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8375 lt!274771)))) ((_ sign_extend 32) (currentByte!8895 (_1!8375 lt!274771))) ((_ sign_extend 32) (currentBit!8890 (_1!8375 lt!274771)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8375 lt!274771)))) ((_ sign_extend 32) (currentByte!8895 (_1!8375 lt!274771))) ((_ sign_extend 32) (currentBit!8890 (_1!8375 lt!274771)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15631 () Bool)

(assert (= bs!15631 d!62667))

(declare-fun m!279407 () Bool)

(assert (=> bs!15631 m!279407))

(assert (=> b!179249 d!62667))

(declare-fun d!62669 () Bool)

(declare-datatypes ((tuple2!15472 0))(
  ( (tuple2!15473 (_1!8381 Bool) (_2!8381 BitStream!7616)) )
))
(declare-fun lt!274915 () tuple2!15472)

(declare-fun readBit!0 (BitStream!7616) tuple2!15472)

(assert (=> d!62669 (= lt!274915 (readBit!0 lt!274767))))

(assert (=> d!62669 (= (readBitPure!0 lt!274767) (tuple2!15463 (_2!8381 lt!274915) (_1!8381 lt!274915)))))

(declare-fun bs!15632 () Bool)

(assert (= bs!15632 d!62669))

(declare-fun m!279439 () Bool)

(assert (=> bs!15632 m!279439))

(assert (=> b!179249 d!62669))

(declare-fun d!62673 () Bool)

(declare-fun e!124733 () Bool)

(assert (=> d!62673 e!124733))

(declare-fun res!148801 () Bool)

(assert (=> d!62673 (=> (not res!148801) (not e!124733))))

(declare-fun lt!274943 () (_ BitVec 64))

(declare-fun lt!274941 () (_ BitVec 64))

(declare-fun lt!274939 () (_ BitVec 64))

(assert (=> d!62673 (= res!148801 (= lt!274939 (bvsub lt!274943 lt!274941)))))

(assert (=> d!62673 (or (= (bvand lt!274943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274943 lt!274941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62673 (= lt!274941 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274763)))) ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274763))) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274763)))))))

(declare-fun lt!274942 () (_ BitVec 64))

(declare-fun lt!274938 () (_ BitVec 64))

(assert (=> d!62673 (= lt!274943 (bvmul lt!274942 lt!274938))))

(assert (=> d!62673 (or (= lt!274942 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274938 (bvsdiv (bvmul lt!274942 lt!274938) lt!274942)))))

(assert (=> d!62673 (= lt!274938 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62673 (= lt!274942 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274763)))))))

(assert (=> d!62673 (= lt!274939 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274763))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274763)))))))

(assert (=> d!62673 (invariant!0 (currentBit!8890 (_1!8376 lt!274763)) (currentByte!8895 (_1!8376 lt!274763)) (size!4254 (buf!4697 (_1!8376 lt!274763))))))

(assert (=> d!62673 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274763))) (currentByte!8895 (_1!8376 lt!274763)) (currentBit!8890 (_1!8376 lt!274763))) lt!274939)))

(declare-fun b!179315 () Bool)

(declare-fun res!148800 () Bool)

(assert (=> b!179315 (=> (not res!148800) (not e!124733))))

(assert (=> b!179315 (= res!148800 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274939))))

(declare-fun b!179316 () Bool)

(declare-fun lt!274940 () (_ BitVec 64))

(assert (=> b!179316 (= e!124733 (bvsle lt!274939 (bvmul lt!274940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179316 (or (= lt!274940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274940)))))

(assert (=> b!179316 (= lt!274940 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274763)))))))

(assert (= (and d!62673 res!148801) b!179315))

(assert (= (and b!179315 res!148800) b!179316))

(declare-fun m!279475 () Bool)

(assert (=> d!62673 m!279475))

(declare-fun m!279477 () Bool)

(assert (=> d!62673 m!279477))

(assert (=> b!179249 d!62673))

(declare-fun d!62685 () Bool)

(declare-fun e!124734 () Bool)

(assert (=> d!62685 e!124734))

(declare-fun res!148803 () Bool)

(assert (=> d!62685 (=> (not res!148803) (not e!124734))))

(declare-fun lt!274949 () (_ BitVec 64))

(declare-fun lt!274947 () (_ BitVec 64))

(declare-fun lt!274945 () (_ BitVec 64))

(assert (=> d!62685 (= res!148803 (= lt!274945 (bvsub lt!274949 lt!274947)))))

(assert (=> d!62685 (or (= (bvand lt!274949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!274947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!274949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!274949 lt!274947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62685 (= lt!274947 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274773)))) ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274773))) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274773)))))))

(declare-fun lt!274948 () (_ BitVec 64))

(declare-fun lt!274944 () (_ BitVec 64))

(assert (=> d!62685 (= lt!274949 (bvmul lt!274948 lt!274944))))

(assert (=> d!62685 (or (= lt!274948 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!274944 (bvsdiv (bvmul lt!274948 lt!274944) lt!274948)))))

(assert (=> d!62685 (= lt!274944 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62685 (= lt!274948 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274773)))))))

(assert (=> d!62685 (= lt!274945 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274773)))))))

(assert (=> d!62685 (invariant!0 (currentBit!8890 (_1!8376 lt!274773)) (currentByte!8895 (_1!8376 lt!274773)) (size!4254 (buf!4697 (_1!8376 lt!274773))))))

(assert (=> d!62685 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274773))) (currentByte!8895 (_1!8376 lt!274773)) (currentBit!8890 (_1!8376 lt!274773))) lt!274945)))

(declare-fun b!179317 () Bool)

(declare-fun res!148802 () Bool)

(assert (=> b!179317 (=> (not res!148802) (not e!124734))))

(assert (=> b!179317 (= res!148802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!274945))))

(declare-fun b!179318 () Bool)

(declare-fun lt!274946 () (_ BitVec 64))

(assert (=> b!179318 (= e!124734 (bvsle lt!274945 (bvmul lt!274946 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179318 (or (= lt!274946 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!274946 #b0000000000000000000000000000000000000000000000000000000000001000) lt!274946)))))

(assert (=> b!179318 (= lt!274946 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274773)))))))

(assert (= (and d!62685 res!148803) b!179317))

(assert (= (and b!179317 res!148802) b!179318))

(declare-fun m!279479 () Bool)

(assert (=> d!62685 m!279479))

(declare-fun m!279481 () Bool)

(assert (=> d!62685 m!279481))

(assert (=> b!179249 d!62685))

(declare-fun d!62687 () Bool)

(declare-fun e!124750 () Bool)

(assert (=> d!62687 e!124750))

(declare-fun res!148825 () Bool)

(assert (=> d!62687 (=> (not res!148825) (not e!124750))))

(declare-fun lt!275018 () tuple2!15460)

(assert (=> d!62687 (= res!148825 (isPrefixOf!0 (_1!8375 lt!275018) (_2!8375 lt!275018)))))

(declare-fun lt!275011 () BitStream!7616)

(assert (=> d!62687 (= lt!275018 (tuple2!15461 lt!275011 (_2!8374 lt!274770)))))

(declare-fun lt!275017 () Unit!12888)

(declare-fun lt!275029 () Unit!12888)

(assert (=> d!62687 (= lt!275017 lt!275029)))

(assert (=> d!62687 (isPrefixOf!0 lt!275011 (_2!8374 lt!274770))))

(assert (=> d!62687 (= lt!275029 (lemmaIsPrefixTransitive!0 lt!275011 (_2!8374 lt!274770) (_2!8374 lt!274770)))))

(declare-fun lt!275023 () Unit!12888)

(declare-fun lt!275026 () Unit!12888)

(assert (=> d!62687 (= lt!275023 lt!275026)))

(assert (=> d!62687 (isPrefixOf!0 lt!275011 (_2!8374 lt!274770))))

(assert (=> d!62687 (= lt!275026 (lemmaIsPrefixTransitive!0 lt!275011 thiss!1204 (_2!8374 lt!274770)))))

(declare-fun lt!275022 () Unit!12888)

(declare-fun e!124749 () Unit!12888)

(assert (=> d!62687 (= lt!275022 e!124749)))

(declare-fun c!9283 () Bool)

(assert (=> d!62687 (= c!9283 (not (= (size!4254 (buf!4697 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!275014 () Unit!12888)

(declare-fun lt!275028 () Unit!12888)

(assert (=> d!62687 (= lt!275014 lt!275028)))

(assert (=> d!62687 (isPrefixOf!0 (_2!8374 lt!274770) (_2!8374 lt!274770))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7616) Unit!12888)

(assert (=> d!62687 (= lt!275028 (lemmaIsPrefixRefl!0 (_2!8374 lt!274770)))))

(declare-fun lt!275016 () Unit!12888)

(declare-fun lt!275027 () Unit!12888)

(assert (=> d!62687 (= lt!275016 lt!275027)))

(assert (=> d!62687 (= lt!275027 (lemmaIsPrefixRefl!0 (_2!8374 lt!274770)))))

(declare-fun lt!275012 () Unit!12888)

(declare-fun lt!275030 () Unit!12888)

(assert (=> d!62687 (= lt!275012 lt!275030)))

(assert (=> d!62687 (isPrefixOf!0 lt!275011 lt!275011)))

(assert (=> d!62687 (= lt!275030 (lemmaIsPrefixRefl!0 lt!275011))))

(declare-fun lt!275024 () Unit!12888)

(declare-fun lt!275021 () Unit!12888)

(assert (=> d!62687 (= lt!275024 lt!275021)))

(assert (=> d!62687 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62687 (= lt!275021 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62687 (= lt!275011 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(assert (=> d!62687 (isPrefixOf!0 thiss!1204 (_2!8374 lt!274770))))

(assert (=> d!62687 (= (reader!0 thiss!1204 (_2!8374 lt!274770)) lt!275018)))

(declare-fun b!179343 () Bool)

(declare-fun lt!275019 () Unit!12888)

(assert (=> b!179343 (= e!124749 lt!275019)))

(declare-fun lt!275013 () (_ BitVec 64))

(assert (=> b!179343 (= lt!275013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!275025 () (_ BitVec 64))

(assert (=> b!179343 (= lt!275025 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9645 array!9645 (_ BitVec 64) (_ BitVec 64)) Unit!12888)

(assert (=> b!179343 (= lt!275019 (arrayBitRangesEqSymmetric!0 (buf!4697 thiss!1204) (buf!4697 (_2!8374 lt!274770)) lt!275013 lt!275025))))

(declare-fun arrayBitRangesEq!0 (array!9645 array!9645 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179343 (arrayBitRangesEq!0 (buf!4697 (_2!8374 lt!274770)) (buf!4697 thiss!1204) lt!275013 lt!275025)))

(declare-fun lt!275015 () (_ BitVec 64))

(declare-fun b!179344 () Bool)

(declare-fun lt!275020 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7616 (_ BitVec 64)) BitStream!7616)

(assert (=> b!179344 (= e!124750 (= (_1!8375 lt!275018) (withMovedBitIndex!0 (_2!8375 lt!275018) (bvsub lt!275020 lt!275015))))))

(assert (=> b!179344 (or (= (bvand lt!275020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275020 lt!275015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179344 (= lt!275015 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770))))))

(assert (=> b!179344 (= lt!275020 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun b!179345 () Bool)

(declare-fun res!148824 () Bool)

(assert (=> b!179345 (=> (not res!148824) (not e!124750))))

(assert (=> b!179345 (= res!148824 (isPrefixOf!0 (_1!8375 lt!275018) thiss!1204))))

(declare-fun b!179346 () Bool)

(declare-fun res!148826 () Bool)

(assert (=> b!179346 (=> (not res!148826) (not e!124750))))

(assert (=> b!179346 (= res!148826 (isPrefixOf!0 (_2!8375 lt!275018) (_2!8374 lt!274770)))))

(declare-fun b!179347 () Bool)

(declare-fun Unit!12916 () Unit!12888)

(assert (=> b!179347 (= e!124749 Unit!12916)))

(assert (= (and d!62687 c!9283) b!179343))

(assert (= (and d!62687 (not c!9283)) b!179347))

(assert (= (and d!62687 res!148825) b!179345))

(assert (= (and b!179345 res!148824) b!179346))

(assert (= (and b!179346 res!148826) b!179344))

(assert (=> b!179343 m!279329))

(declare-fun m!279499 () Bool)

(assert (=> b!179343 m!279499))

(declare-fun m!279501 () Bool)

(assert (=> b!179343 m!279501))

(declare-fun m!279503 () Bool)

(assert (=> b!179345 m!279503))

(declare-fun m!279505 () Bool)

(assert (=> b!179346 m!279505))

(declare-fun m!279507 () Bool)

(assert (=> d!62687 m!279507))

(declare-fun m!279509 () Bool)

(assert (=> d!62687 m!279509))

(declare-fun m!279511 () Bool)

(assert (=> d!62687 m!279511))

(declare-fun m!279513 () Bool)

(assert (=> d!62687 m!279513))

(declare-fun m!279515 () Bool)

(assert (=> d!62687 m!279515))

(declare-fun m!279517 () Bool)

(assert (=> d!62687 m!279517))

(declare-fun m!279519 () Bool)

(assert (=> d!62687 m!279519))

(declare-fun m!279521 () Bool)

(assert (=> d!62687 m!279521))

(declare-fun m!279523 () Bool)

(assert (=> d!62687 m!279523))

(declare-fun m!279525 () Bool)

(assert (=> d!62687 m!279525))

(assert (=> d!62687 m!279365))

(declare-fun m!279527 () Bool)

(assert (=> b!179344 m!279527))

(assert (=> b!179344 m!279363))

(assert (=> b!179344 m!279329))

(assert (=> b!179249 d!62687))

(declare-fun d!62697 () Bool)

(declare-fun lt!275031 () tuple2!15472)

(assert (=> d!62697 (= lt!275031 (readBit!0 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204))))))

(assert (=> d!62697 (= (readBitPure!0 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204))) (tuple2!15463 (_2!8381 lt!275031) (_1!8381 lt!275031)))))

(declare-fun bs!15636 () Bool)

(assert (= bs!15636 d!62697))

(declare-fun m!279529 () Bool)

(assert (=> bs!15636 m!279529))

(assert (=> b!179249 d!62697))

(declare-fun d!62699 () Bool)

(declare-fun e!124752 () Bool)

(assert (=> d!62699 e!124752))

(declare-fun res!148828 () Bool)

(assert (=> d!62699 (=> (not res!148828) (not e!124752))))

(declare-fun lt!275039 () tuple2!15460)

(assert (=> d!62699 (= res!148828 (isPrefixOf!0 (_1!8375 lt!275039) (_2!8375 lt!275039)))))

(declare-fun lt!275032 () BitStream!7616)

(assert (=> d!62699 (= lt!275039 (tuple2!15461 lt!275032 (_2!8374 lt!274770)))))

(declare-fun lt!275038 () Unit!12888)

(declare-fun lt!275050 () Unit!12888)

(assert (=> d!62699 (= lt!275038 lt!275050)))

(assert (=> d!62699 (isPrefixOf!0 lt!275032 (_2!8374 lt!274770))))

(assert (=> d!62699 (= lt!275050 (lemmaIsPrefixTransitive!0 lt!275032 (_2!8374 lt!274770) (_2!8374 lt!274770)))))

(declare-fun lt!275044 () Unit!12888)

(declare-fun lt!275047 () Unit!12888)

(assert (=> d!62699 (= lt!275044 lt!275047)))

(assert (=> d!62699 (isPrefixOf!0 lt!275032 (_2!8374 lt!274770))))

(assert (=> d!62699 (= lt!275047 (lemmaIsPrefixTransitive!0 lt!275032 (_2!8374 lt!274772) (_2!8374 lt!274770)))))

(declare-fun lt!275043 () Unit!12888)

(declare-fun e!124751 () Unit!12888)

(assert (=> d!62699 (= lt!275043 e!124751)))

(declare-fun c!9284 () Bool)

(assert (=> d!62699 (= c!9284 (not (= (size!4254 (buf!4697 (_2!8374 lt!274772))) #b00000000000000000000000000000000)))))

(declare-fun lt!275035 () Unit!12888)

(declare-fun lt!275049 () Unit!12888)

(assert (=> d!62699 (= lt!275035 lt!275049)))

(assert (=> d!62699 (isPrefixOf!0 (_2!8374 lt!274770) (_2!8374 lt!274770))))

(assert (=> d!62699 (= lt!275049 (lemmaIsPrefixRefl!0 (_2!8374 lt!274770)))))

(declare-fun lt!275037 () Unit!12888)

(declare-fun lt!275048 () Unit!12888)

(assert (=> d!62699 (= lt!275037 lt!275048)))

(assert (=> d!62699 (= lt!275048 (lemmaIsPrefixRefl!0 (_2!8374 lt!274770)))))

(declare-fun lt!275033 () Unit!12888)

(declare-fun lt!275051 () Unit!12888)

(assert (=> d!62699 (= lt!275033 lt!275051)))

(assert (=> d!62699 (isPrefixOf!0 lt!275032 lt!275032)))

(assert (=> d!62699 (= lt!275051 (lemmaIsPrefixRefl!0 lt!275032))))

(declare-fun lt!275045 () Unit!12888)

(declare-fun lt!275042 () Unit!12888)

(assert (=> d!62699 (= lt!275045 lt!275042)))

(assert (=> d!62699 (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!274772))))

(assert (=> d!62699 (= lt!275042 (lemmaIsPrefixRefl!0 (_2!8374 lt!274772)))))

(assert (=> d!62699 (= lt!275032 (BitStream!7617 (buf!4697 (_2!8374 lt!274770)) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(assert (=> d!62699 (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!274770))))

(assert (=> d!62699 (= (reader!0 (_2!8374 lt!274772) (_2!8374 lt!274770)) lt!275039)))

(declare-fun b!179348 () Bool)

(declare-fun lt!275040 () Unit!12888)

(assert (=> b!179348 (= e!124751 lt!275040)))

(declare-fun lt!275034 () (_ BitVec 64))

(assert (=> b!179348 (= lt!275034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!275046 () (_ BitVec 64))

(assert (=> b!179348 (= lt!275046 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(assert (=> b!179348 (= lt!275040 (arrayBitRangesEqSymmetric!0 (buf!4697 (_2!8374 lt!274772)) (buf!4697 (_2!8374 lt!274770)) lt!275034 lt!275046))))

(assert (=> b!179348 (arrayBitRangesEq!0 (buf!4697 (_2!8374 lt!274770)) (buf!4697 (_2!8374 lt!274772)) lt!275034 lt!275046)))

(declare-fun b!179349 () Bool)

(declare-fun lt!275036 () (_ BitVec 64))

(declare-fun lt!275041 () (_ BitVec 64))

(assert (=> b!179349 (= e!124752 (= (_1!8375 lt!275039) (withMovedBitIndex!0 (_2!8375 lt!275039) (bvsub lt!275041 lt!275036))))))

(assert (=> b!179349 (or (= (bvand lt!275041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275041 lt!275036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179349 (= lt!275036 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770))))))

(assert (=> b!179349 (= lt!275041 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(declare-fun b!179350 () Bool)

(declare-fun res!148827 () Bool)

(assert (=> b!179350 (=> (not res!148827) (not e!124752))))

(assert (=> b!179350 (= res!148827 (isPrefixOf!0 (_1!8375 lt!275039) (_2!8374 lt!274772)))))

(declare-fun b!179351 () Bool)

(declare-fun res!148829 () Bool)

(assert (=> b!179351 (=> (not res!148829) (not e!124752))))

(assert (=> b!179351 (= res!148829 (isPrefixOf!0 (_2!8375 lt!275039) (_2!8374 lt!274770)))))

(declare-fun b!179352 () Bool)

(declare-fun Unit!12917 () Unit!12888)

(assert (=> b!179352 (= e!124751 Unit!12917)))

(assert (= (and d!62699 c!9284) b!179348))

(assert (= (and d!62699 (not c!9284)) b!179352))

(assert (= (and d!62699 res!148828) b!179350))

(assert (= (and b!179350 res!148827) b!179351))

(assert (= (and b!179351 res!148829) b!179349))

(assert (=> b!179348 m!279327))

(declare-fun m!279531 () Bool)

(assert (=> b!179348 m!279531))

(declare-fun m!279533 () Bool)

(assert (=> b!179348 m!279533))

(declare-fun m!279535 () Bool)

(assert (=> b!179350 m!279535))

(declare-fun m!279537 () Bool)

(assert (=> b!179351 m!279537))

(declare-fun m!279539 () Bool)

(assert (=> d!62699 m!279539))

(declare-fun m!279541 () Bool)

(assert (=> d!62699 m!279541))

(assert (=> d!62699 m!279511))

(declare-fun m!279543 () Bool)

(assert (=> d!62699 m!279543))

(declare-fun m!279545 () Bool)

(assert (=> d!62699 m!279545))

(declare-fun m!279547 () Bool)

(assert (=> d!62699 m!279547))

(assert (=> d!62699 m!279519))

(declare-fun m!279549 () Bool)

(assert (=> d!62699 m!279549))

(declare-fun m!279551 () Bool)

(assert (=> d!62699 m!279551))

(declare-fun m!279553 () Bool)

(assert (=> d!62699 m!279553))

(assert (=> d!62699 m!279357))

(declare-fun m!279555 () Bool)

(assert (=> b!179349 m!279555))

(assert (=> b!179349 m!279363))

(assert (=> b!179349 m!279327))

(assert (=> b!179249 d!62699))

(declare-fun d!62701 () Bool)

(assert (=> d!62701 (= (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274772)))) (and (bvsge (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8890 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8895 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274772)))) (and (= (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274772))))))))))

(assert (=> b!179249 d!62701))

(declare-fun d!62703 () Bool)

(assert (=> d!62703 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204))))))

(declare-fun bs!15637 () Bool)

(assert (= bs!15637 d!62703))

(assert (=> bs!15637 m!279361))

(assert (=> start!39630 d!62703))

(declare-fun d!62705 () Bool)

(assert (=> d!62705 (= (invariant!0 (currentBit!8890 (_2!8374 lt!274770)) (currentByte!8895 (_2!8374 lt!274770)) (size!4254 (buf!4697 (_2!8374 lt!274770)))) (and (bvsge (currentBit!8890 (_2!8374 lt!274770)) #b00000000000000000000000000000000) (bvslt (currentBit!8890 (_2!8374 lt!274770)) #b00000000000000000000000000001000) (bvsge (currentByte!8895 (_2!8374 lt!274770)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8895 (_2!8374 lt!274770)) (size!4254 (buf!4697 (_2!8374 lt!274770)))) (and (= (currentBit!8890 (_2!8374 lt!274770)) #b00000000000000000000000000000000) (= (currentByte!8895 (_2!8374 lt!274770)) (size!4254 (buf!4697 (_2!8374 lt!274770))))))))))

(assert (=> b!179256 d!62705))

(declare-fun d!62707 () Bool)

(declare-fun res!148836 () Bool)

(declare-fun e!124758 () Bool)

(assert (=> d!62707 (=> (not res!148836) (not e!124758))))

(assert (=> d!62707 (= res!148836 (= (size!4254 (buf!4697 thiss!1204)) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (=> d!62707 (= (isPrefixOf!0 thiss!1204 (_2!8374 lt!274772)) e!124758)))

(declare-fun b!179359 () Bool)

(declare-fun res!148837 () Bool)

(assert (=> b!179359 (=> (not res!148837) (not e!124758))))

(assert (=> b!179359 (= res!148837 (bvsle (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772)))))))

(declare-fun b!179360 () Bool)

(declare-fun e!124757 () Bool)

(assert (=> b!179360 (= e!124758 e!124757)))

(declare-fun res!148838 () Bool)

(assert (=> b!179360 (=> res!148838 e!124757)))

(assert (=> b!179360 (= res!148838 (= (size!4254 (buf!4697 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179361 () Bool)

(assert (=> b!179361 (= e!124757 (arrayBitRangesEq!0 (buf!4697 thiss!1204) (buf!4697 (_2!8374 lt!274772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204))))))

(assert (= (and d!62707 res!148836) b!179359))

(assert (= (and b!179359 res!148837) b!179360))

(assert (= (and b!179360 (not res!148838)) b!179361))

(assert (=> b!179359 m!279329))

(assert (=> b!179359 m!279327))

(assert (=> b!179361 m!279329))

(assert (=> b!179361 m!279329))

(declare-fun m!279557 () Bool)

(assert (=> b!179361 m!279557))

(assert (=> b!179246 d!62707))

(declare-fun d!62709 () Bool)

(declare-fun e!124759 () Bool)

(assert (=> d!62709 e!124759))

(declare-fun res!148840 () Bool)

(assert (=> d!62709 (=> (not res!148840) (not e!124759))))

(declare-fun lt!275055 () (_ BitVec 64))

(declare-fun lt!275053 () (_ BitVec 64))

(declare-fun lt!275057 () (_ BitVec 64))

(assert (=> d!62709 (= res!148840 (= lt!275053 (bvsub lt!275057 lt!275055)))))

(assert (=> d!62709 (or (= (bvand lt!275057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275057 lt!275055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62709 (= lt!275055 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274772)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772)))))))

(declare-fun lt!275056 () (_ BitVec 64))

(declare-fun lt!275052 () (_ BitVec 64))

(assert (=> d!62709 (= lt!275057 (bvmul lt!275056 lt!275052))))

(assert (=> d!62709 (or (= lt!275056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275052 (bvsdiv (bvmul lt!275056 lt!275052) lt!275056)))))

(assert (=> d!62709 (= lt!275052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62709 (= lt!275056 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (=> d!62709 (= lt!275053 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772)))))))

(assert (=> d!62709 (invariant!0 (currentBit!8890 (_2!8374 lt!274772)) (currentByte!8895 (_2!8374 lt!274772)) (size!4254 (buf!4697 (_2!8374 lt!274772))))))

(assert (=> d!62709 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) lt!275053)))

(declare-fun b!179362 () Bool)

(declare-fun res!148839 () Bool)

(assert (=> b!179362 (=> (not res!148839) (not e!124759))))

(assert (=> b!179362 (= res!148839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275053))))

(declare-fun b!179363 () Bool)

(declare-fun lt!275054 () (_ BitVec 64))

(assert (=> b!179363 (= e!124759 (bvsle lt!275053 (bvmul lt!275054 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179363 (or (= lt!275054 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275054 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275054)))))

(assert (=> b!179363 (= lt!275054 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (= (and d!62709 res!148840) b!179362))

(assert (= (and b!179362 res!148839) b!179363))

(declare-fun m!279559 () Bool)

(assert (=> d!62709 m!279559))

(declare-fun m!279561 () Bool)

(assert (=> d!62709 m!279561))

(assert (=> b!179257 d!62709))

(declare-fun d!62711 () Bool)

(declare-fun e!124760 () Bool)

(assert (=> d!62711 e!124760))

(declare-fun res!148842 () Bool)

(assert (=> d!62711 (=> (not res!148842) (not e!124760))))

(declare-fun lt!275061 () (_ BitVec 64))

(declare-fun lt!275059 () (_ BitVec 64))

(declare-fun lt!275063 () (_ BitVec 64))

(assert (=> d!62711 (= res!148842 (= lt!275059 (bvsub lt!275063 lt!275061)))))

(assert (=> d!62711 (or (= (bvand lt!275063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275063 lt!275061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62711 (= lt!275061 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))) ((_ sign_extend 32) (currentByte!8895 thiss!1204)) ((_ sign_extend 32) (currentBit!8890 thiss!1204))))))

(declare-fun lt!275062 () (_ BitVec 64))

(declare-fun lt!275058 () (_ BitVec 64))

(assert (=> d!62711 (= lt!275063 (bvmul lt!275062 lt!275058))))

(assert (=> d!62711 (or (= lt!275062 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275058 (bvsdiv (bvmul lt!275062 lt!275058) lt!275062)))))

(assert (=> d!62711 (= lt!275058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62711 (= lt!275062 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))))))

(assert (=> d!62711 (= lt!275059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 thiss!1204))))))

(assert (=> d!62711 (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204)))))

(assert (=> d!62711 (= (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)) lt!275059)))

(declare-fun b!179364 () Bool)

(declare-fun res!148841 () Bool)

(assert (=> b!179364 (=> (not res!148841) (not e!124760))))

(assert (=> b!179364 (= res!148841 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275059))))

(declare-fun b!179365 () Bool)

(declare-fun lt!275060 () (_ BitVec 64))

(assert (=> b!179365 (= e!124760 (bvsle lt!275059 (bvmul lt!275060 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179365 (or (= lt!275060 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275060 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275060)))))

(assert (=> b!179365 (= lt!275060 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))))))

(assert (= (and d!62711 res!148842) b!179364))

(assert (= (and b!179364 res!148841) b!179365))

(assert (=> d!62711 m!279395))

(assert (=> d!62711 m!279361))

(assert (=> b!179257 d!62711))

(declare-fun b!179375 () Bool)

(declare-fun res!148852 () Bool)

(declare-fun e!124765 () Bool)

(assert (=> b!179375 (=> (not res!148852) (not e!124765))))

(declare-fun lt!275073 () (_ BitVec 64))

(declare-fun lt!275075 () tuple2!15458)

(declare-fun lt!275074 () (_ BitVec 64))

(assert (=> b!179375 (= res!148852 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275075))) (currentByte!8895 (_2!8374 lt!275075)) (currentBit!8890 (_2!8374 lt!275075))) (bvadd lt!275074 lt!275073)))))

(assert (=> b!179375 (or (not (= (bvand lt!275074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275073 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275074 lt!275073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179375 (= lt!275073 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!179375 (= lt!275074 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun d!62713 () Bool)

(assert (=> d!62713 e!124765))

(declare-fun res!148853 () Bool)

(assert (=> d!62713 (=> (not res!148853) (not e!124765))))

(assert (=> d!62713 (= res!148853 (= (size!4254 (buf!4697 thiss!1204)) (size!4254 (buf!4697 (_2!8374 lt!275075)))))))

(declare-fun choose!16 (BitStream!7616 Bool) tuple2!15458)

(assert (=> d!62713 (= lt!275075 (choose!16 thiss!1204 lt!274761))))

(assert (=> d!62713 (validate_offset_bit!0 ((_ sign_extend 32) (size!4254 (buf!4697 thiss!1204))) ((_ sign_extend 32) (currentByte!8895 thiss!1204)) ((_ sign_extend 32) (currentBit!8890 thiss!1204)))))

(assert (=> d!62713 (= (appendBit!0 thiss!1204 lt!274761) lt!275075)))

(declare-fun b!179376 () Bool)

(declare-fun res!148854 () Bool)

(assert (=> b!179376 (=> (not res!148854) (not e!124765))))

(assert (=> b!179376 (= res!148854 (isPrefixOf!0 thiss!1204 (_2!8374 lt!275075)))))

(declare-fun b!179377 () Bool)

(declare-fun e!124766 () Bool)

(assert (=> b!179377 (= e!124765 e!124766)))

(declare-fun res!148851 () Bool)

(assert (=> b!179377 (=> (not res!148851) (not e!124766))))

(declare-fun lt!275072 () tuple2!15462)

(assert (=> b!179377 (= res!148851 (and (= (_2!8376 lt!275072) lt!274761) (= (_1!8376 lt!275072) (_2!8374 lt!275075))))))

(assert (=> b!179377 (= lt!275072 (readBitPure!0 (readerFrom!0 (_2!8374 lt!275075) (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204))))))

(declare-fun b!179378 () Bool)

(assert (=> b!179378 (= e!124766 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!275072))) (currentByte!8895 (_1!8376 lt!275072)) (currentBit!8890 (_1!8376 lt!275072))) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275075))) (currentByte!8895 (_2!8374 lt!275075)) (currentBit!8890 (_2!8374 lt!275075)))))))

(assert (= (and d!62713 res!148853) b!179375))

(assert (= (and b!179375 res!148852) b!179376))

(assert (= (and b!179376 res!148854) b!179377))

(assert (= (and b!179377 res!148851) b!179378))

(declare-fun m!279563 () Bool)

(assert (=> b!179376 m!279563))

(declare-fun m!279565 () Bool)

(assert (=> b!179375 m!279565))

(assert (=> b!179375 m!279329))

(declare-fun m!279567 () Bool)

(assert (=> b!179377 m!279567))

(assert (=> b!179377 m!279567))

(declare-fun m!279569 () Bool)

(assert (=> b!179377 m!279569))

(declare-fun m!279571 () Bool)

(assert (=> b!179378 m!279571))

(assert (=> b!179378 m!279565))

(declare-fun m!279573 () Bool)

(assert (=> d!62713 m!279573))

(declare-fun m!279575 () Bool)

(assert (=> d!62713 m!279575))

(assert (=> b!179257 d!62713))

(declare-fun d!62715 () Bool)

(declare-fun e!124767 () Bool)

(assert (=> d!62715 e!124767))

(declare-fun res!148856 () Bool)

(assert (=> d!62715 (=> (not res!148856) (not e!124767))))

(declare-fun lt!275079 () (_ BitVec 64))

(declare-fun lt!275077 () (_ BitVec 64))

(declare-fun lt!275081 () (_ BitVec 64))

(assert (=> d!62715 (= res!148856 (= lt!275077 (bvsub lt!275081 lt!275079)))))

(assert (=> d!62715 (or (= (bvand lt!275081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275081 lt!275079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62715 (= lt!275079 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274770)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274770))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274770)))))))

(declare-fun lt!275080 () (_ BitVec 64))

(declare-fun lt!275076 () (_ BitVec 64))

(assert (=> d!62715 (= lt!275081 (bvmul lt!275080 lt!275076))))

(assert (=> d!62715 (or (= lt!275080 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275076 (bvsdiv (bvmul lt!275080 lt!275076) lt!275080)))))

(assert (=> d!62715 (= lt!275076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62715 (= lt!275080 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274770)))))))

(assert (=> d!62715 (= lt!275077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274770))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274770)))))))

(assert (=> d!62715 (invariant!0 (currentBit!8890 (_2!8374 lt!274770)) (currentByte!8895 (_2!8374 lt!274770)) (size!4254 (buf!4697 (_2!8374 lt!274770))))))

(assert (=> d!62715 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770))) lt!275077)))

(declare-fun b!179379 () Bool)

(declare-fun res!148855 () Bool)

(assert (=> b!179379 (=> (not res!148855) (not e!124767))))

(assert (=> b!179379 (= res!148855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275077))))

(declare-fun b!179380 () Bool)

(declare-fun lt!275078 () (_ BitVec 64))

(assert (=> b!179380 (= e!124767 (bvsle lt!275077 (bvmul lt!275078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179380 (or (= lt!275078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275078)))))

(assert (=> b!179380 (= lt!275078 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274770)))))))

(assert (= (and d!62715 res!148856) b!179379))

(assert (= (and b!179379 res!148855) b!179380))

(declare-fun m!279577 () Bool)

(assert (=> d!62715 m!279577))

(assert (=> d!62715 m!279377))

(assert (=> b!179252 d!62715))

(declare-fun d!62717 () Bool)

(declare-fun res!148857 () Bool)

(declare-fun e!124769 () Bool)

(assert (=> d!62717 (=> (not res!148857) (not e!124769))))

(assert (=> d!62717 (= res!148857 (= (size!4254 (buf!4697 thiss!1204)) (size!4254 (buf!4697 (_2!8374 lt!274770)))))))

(assert (=> d!62717 (= (isPrefixOf!0 thiss!1204 (_2!8374 lt!274770)) e!124769)))

(declare-fun b!179381 () Bool)

(declare-fun res!148858 () Bool)

(assert (=> b!179381 (=> (not res!148858) (not e!124769))))

(assert (=> b!179381 (= res!148858 (bvsle (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770)))))))

(declare-fun b!179382 () Bool)

(declare-fun e!124768 () Bool)

(assert (=> b!179382 (= e!124769 e!124768)))

(declare-fun res!148859 () Bool)

(assert (=> b!179382 (=> res!148859 e!124768)))

(assert (=> b!179382 (= res!148859 (= (size!4254 (buf!4697 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!179383 () Bool)

(assert (=> b!179383 (= e!124768 (arrayBitRangesEq!0 (buf!4697 thiss!1204) (buf!4697 (_2!8374 lt!274770)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4254 (buf!4697 thiss!1204)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204))))))

(assert (= (and d!62717 res!148857) b!179381))

(assert (= (and b!179381 res!148858) b!179382))

(assert (= (and b!179382 (not res!148859)) b!179383))

(assert (=> b!179381 m!279329))

(assert (=> b!179381 m!279363))

(assert (=> b!179383 m!279329))

(assert (=> b!179383 m!279329))

(declare-fun m!279579 () Bool)

(assert (=> b!179383 m!279579))

(assert (=> b!179252 d!62717))

(declare-fun d!62719 () Bool)

(assert (=> d!62719 (isPrefixOf!0 thiss!1204 (_2!8374 lt!274770))))

(declare-fun lt!275084 () Unit!12888)

(declare-fun choose!30 (BitStream!7616 BitStream!7616 BitStream!7616) Unit!12888)

(assert (=> d!62719 (= lt!275084 (choose!30 thiss!1204 (_2!8374 lt!274772) (_2!8374 lt!274770)))))

(assert (=> d!62719 (isPrefixOf!0 thiss!1204 (_2!8374 lt!274772))))

(assert (=> d!62719 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8374 lt!274772) (_2!8374 lt!274770)) lt!275084)))

(declare-fun bs!15638 () Bool)

(assert (= bs!15638 d!62719))

(assert (=> bs!15638 m!279365))

(declare-fun m!279581 () Bool)

(assert (=> bs!15638 m!279581))

(assert (=> bs!15638 m!279337))

(assert (=> b!179252 d!62719))

(declare-fun b!179593 () Bool)

(declare-fun e!124889 () Bool)

(declare-fun e!124891 () Bool)

(assert (=> b!179593 (= e!124889 e!124891)))

(declare-fun res!149040 () Bool)

(assert (=> b!179593 (=> (not res!149040) (not e!124891))))

(declare-datatypes ((tuple2!15474 0))(
  ( (tuple2!15475 (_1!8382 BitStream!7616) (_2!8382 (_ BitVec 64))) )
))
(declare-fun lt!275726 () tuple2!15474)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179593 (= res!149040 (= (_2!8382 lt!275726) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!275713 () tuple2!15460)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15474)

(assert (=> b!179593 (= lt!275726 (readNBitsLSBFirstsLoopPure!0 (_1!8375 lt!275713) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!275707 () Unit!12888)

(declare-fun lt!275746 () Unit!12888)

(assert (=> b!179593 (= lt!275707 lt!275746)))

(declare-fun lt!275716 () tuple2!15458)

(declare-fun lt!275715 () (_ BitVec 64))

(assert (=> b!179593 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!275716)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772))) lt!275715)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7616 array!9645 (_ BitVec 64)) Unit!12888)

(assert (=> b!179593 (= lt!275746 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8374 lt!274772) (buf!4697 (_2!8374 lt!275716)) lt!275715))))

(declare-fun e!124888 () Bool)

(assert (=> b!179593 e!124888))

(declare-fun res!149030 () Bool)

(assert (=> b!179593 (=> (not res!149030) (not e!124888))))

(assert (=> b!179593 (= res!149030 (and (= (size!4254 (buf!4697 (_2!8374 lt!274772))) (size!4254 (buf!4697 (_2!8374 lt!275716)))) (bvsge lt!275715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179593 (= lt!275715 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!179593 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!179593 (= lt!275713 (reader!0 (_2!8374 lt!274772) (_2!8374 lt!275716)))))

(declare-fun b!179595 () Bool)

(declare-fun res!149035 () Bool)

(assert (=> b!179595 (=> (not res!149035) (not e!124889))))

(declare-fun lt!275731 () (_ BitVec 64))

(declare-fun lt!275703 () (_ BitVec 64))

(assert (=> b!179595 (= res!149035 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275716))) (currentByte!8895 (_2!8374 lt!275716)) (currentBit!8890 (_2!8374 lt!275716))) (bvsub lt!275731 lt!275703)))))

(assert (=> b!179595 (or (= (bvand lt!275731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275731 lt!275703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179595 (= lt!275703 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!275697 () (_ BitVec 64))

(declare-fun lt!275745 () (_ BitVec 64))

(assert (=> b!179595 (= lt!275731 (bvadd lt!275697 lt!275745))))

(assert (=> b!179595 (or (not (= (bvand lt!275697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275745 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!275697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!275697 lt!275745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179595 (= lt!275745 ((_ sign_extend 32) nBits!348))))

(assert (=> b!179595 (= lt!275697 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(declare-fun b!179596 () Bool)

(declare-fun res!149032 () Bool)

(declare-fun lt!275708 () tuple2!15458)

(assert (=> b!179596 (= res!149032 (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!275708)))))

(declare-fun e!124887 () Bool)

(assert (=> b!179596 (=> (not res!149032) (not e!124887))))

(declare-fun b!179597 () Bool)

(declare-fun e!124886 () (_ BitVec 64))

(assert (=> b!179597 (= e!124886 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!179598 () Bool)

(declare-fun e!124893 () tuple2!15458)

(declare-fun lt!275749 () tuple2!15458)

(assert (=> b!179598 (= e!124893 (tuple2!15459 (_1!8374 lt!275749) (_2!8374 lt!275749)))))

(declare-fun lt!275751 () Bool)

(assert (=> b!179598 (= lt!275751 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!179598 (= lt!275708 (appendBit!0 (_2!8374 lt!274772) lt!275751))))

(declare-fun res!149036 () Bool)

(assert (=> b!179598 (= res!149036 (= (size!4254 (buf!4697 (_2!8374 lt!274772))) (size!4254 (buf!4697 (_2!8374 lt!275708)))))))

(assert (=> b!179598 (=> (not res!149036) (not e!124887))))

(assert (=> b!179598 e!124887))

(declare-fun lt!275705 () tuple2!15458)

(assert (=> b!179598 (= lt!275705 lt!275708)))

(assert (=> b!179598 (= lt!275749 (appendBitsLSBFirstLoopTR!0 (_2!8374 lt!275705) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!275737 () Unit!12888)

(assert (=> b!179598 (= lt!275737 (lemmaIsPrefixTransitive!0 (_2!8374 lt!274772) (_2!8374 lt!275705) (_2!8374 lt!275749)))))

(declare-fun call!2936 () Bool)

(assert (=> b!179598 call!2936))

(declare-fun lt!275721 () Unit!12888)

(assert (=> b!179598 (= lt!275721 lt!275737)))

(assert (=> b!179598 (invariant!0 (currentBit!8890 (_2!8374 lt!274772)) (currentByte!8895 (_2!8374 lt!274772)) (size!4254 (buf!4697 (_2!8374 lt!275705))))))

(declare-fun lt!275699 () BitStream!7616)

(assert (=> b!179598 (= lt!275699 (BitStream!7617 (buf!4697 (_2!8374 lt!275705)) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))))))

(assert (=> b!179598 (invariant!0 (currentBit!8890 lt!275699) (currentByte!8895 lt!275699) (size!4254 (buf!4697 (_2!8374 lt!275749))))))

(declare-fun lt!275701 () BitStream!7616)

(assert (=> b!179598 (= lt!275701 (BitStream!7617 (buf!4697 (_2!8374 lt!275749)) (currentByte!8895 lt!275699) (currentBit!8890 lt!275699)))))

(declare-fun lt!275722 () tuple2!15462)

(assert (=> b!179598 (= lt!275722 (readBitPure!0 lt!275699))))

(declare-fun lt!275735 () tuple2!15462)

(assert (=> b!179598 (= lt!275735 (readBitPure!0 lt!275701))))

(declare-fun lt!275725 () Unit!12888)

(assert (=> b!179598 (= lt!275725 (readBitPrefixLemma!0 lt!275699 (_2!8374 lt!275749)))))

(declare-fun res!149031 () Bool)

(assert (=> b!179598 (= res!149031 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!275722))) (currentByte!8895 (_1!8376 lt!275722)) (currentBit!8890 (_1!8376 lt!275722))) (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!275735))) (currentByte!8895 (_1!8376 lt!275735)) (currentBit!8890 (_1!8376 lt!275735)))))))

(declare-fun e!124892 () Bool)

(assert (=> b!179598 (=> (not res!149031) (not e!124892))))

(assert (=> b!179598 e!124892))

(declare-fun lt!275750 () Unit!12888)

(assert (=> b!179598 (= lt!275750 lt!275725)))

(declare-fun lt!275704 () tuple2!15460)

(assert (=> b!179598 (= lt!275704 (reader!0 (_2!8374 lt!274772) (_2!8374 lt!275749)))))

(declare-fun lt!275727 () tuple2!15460)

(assert (=> b!179598 (= lt!275727 (reader!0 (_2!8374 lt!275705) (_2!8374 lt!275749)))))

(declare-fun lt!275720 () tuple2!15462)

(assert (=> b!179598 (= lt!275720 (readBitPure!0 (_1!8375 lt!275704)))))

(assert (=> b!179598 (= (_2!8376 lt!275720) lt!275751)))

(declare-fun lt!275738 () Unit!12888)

(declare-fun Unit!12918 () Unit!12888)

(assert (=> b!179598 (= lt!275738 Unit!12918)))

(declare-fun lt!275711 () (_ BitVec 64))

(assert (=> b!179598 (= lt!275711 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275752 () (_ BitVec 64))

(assert (=> b!179598 (= lt!275752 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275739 () Unit!12888)

(assert (=> b!179598 (= lt!275739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8374 lt!274772) (buf!4697 (_2!8374 lt!275749)) lt!275752))))

(assert (=> b!179598 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!275749)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772))) lt!275752)))

(declare-fun lt!275736 () Unit!12888)

(assert (=> b!179598 (= lt!275736 lt!275739)))

(declare-fun lt!275732 () tuple2!15474)

(assert (=> b!179598 (= lt!275732 (readNBitsLSBFirstsLoopPure!0 (_1!8375 lt!275704) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275711))))

(declare-fun lt!275734 () (_ BitVec 64))

(assert (=> b!179598 (= lt!275734 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!275700 () Unit!12888)

(assert (=> b!179598 (= lt!275700 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8374 lt!275705) (buf!4697 (_2!8374 lt!275749)) lt!275734))))

(assert (=> b!179598 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!275749)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!275705))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!275705))) lt!275734)))

(declare-fun lt!275698 () Unit!12888)

(assert (=> b!179598 (= lt!275698 lt!275700)))

(declare-fun lt!275730 () tuple2!15474)

(assert (=> b!179598 (= lt!275730 (readNBitsLSBFirstsLoopPure!0 (_1!8375 lt!275727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275711 (ite (_2!8376 lt!275720) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!275724 () tuple2!15474)

(assert (=> b!179598 (= lt!275724 (readNBitsLSBFirstsLoopPure!0 (_1!8375 lt!275704) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275711))))

(declare-fun c!9306 () Bool)

(assert (=> b!179598 (= c!9306 (_2!8376 (readBitPure!0 (_1!8375 lt!275704))))))

(declare-fun lt!275728 () tuple2!15474)

(assert (=> b!179598 (= lt!275728 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8375 lt!275704) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!275711 e!124886)))))

(declare-fun lt!275712 () Unit!12888)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12888)

(assert (=> b!179598 (= lt!275712 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8375 lt!275704) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!275711))))

(assert (=> b!179598 (and (= (_2!8382 lt!275724) (_2!8382 lt!275728)) (= (_1!8382 lt!275724) (_1!8382 lt!275728)))))

(declare-fun lt!275709 () Unit!12888)

(assert (=> b!179598 (= lt!275709 lt!275712)))

(assert (=> b!179598 (= (_1!8375 lt!275704) (withMovedBitIndex!0 (_2!8375 lt!275704) (bvsub (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275749))) (currentByte!8895 (_2!8374 lt!275749)) (currentBit!8890 (_2!8374 lt!275749))))))))

(declare-fun lt!275744 () Unit!12888)

(declare-fun Unit!12919 () Unit!12888)

(assert (=> b!179598 (= lt!275744 Unit!12919)))

(assert (=> b!179598 (= (_1!8375 lt!275727) (withMovedBitIndex!0 (_2!8375 lt!275727) (bvsub (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275705))) (currentByte!8895 (_2!8374 lt!275705)) (currentBit!8890 (_2!8374 lt!275705))) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275749))) (currentByte!8895 (_2!8374 lt!275749)) (currentBit!8890 (_2!8374 lt!275749))))))))

(declare-fun lt!275706 () Unit!12888)

(declare-fun Unit!12920 () Unit!12888)

(assert (=> b!179598 (= lt!275706 Unit!12920)))

(assert (=> b!179598 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) (bvsub (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275705))) (currentByte!8895 (_2!8374 lt!275705)) (currentBit!8890 (_2!8374 lt!275705))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!275733 () Unit!12888)

(declare-fun Unit!12921 () Unit!12888)

(assert (=> b!179598 (= lt!275733 Unit!12921)))

(assert (=> b!179598 (= (_2!8382 lt!275732) (_2!8382 lt!275730))))

(declare-fun lt!275747 () Unit!12888)

(declare-fun Unit!12922 () Unit!12888)

(assert (=> b!179598 (= lt!275747 Unit!12922)))

(assert (=> b!179598 (invariant!0 (currentBit!8890 (_2!8374 lt!275749)) (currentByte!8895 (_2!8374 lt!275749)) (size!4254 (buf!4697 (_2!8374 lt!275749))))))

(declare-fun lt!275743 () Unit!12888)

(declare-fun Unit!12923 () Unit!12888)

(assert (=> b!179598 (= lt!275743 Unit!12923)))

(assert (=> b!179598 (= (size!4254 (buf!4697 (_2!8374 lt!274772))) (size!4254 (buf!4697 (_2!8374 lt!275749))))))

(declare-fun lt!275741 () Unit!12888)

(declare-fun Unit!12924 () Unit!12888)

(assert (=> b!179598 (= lt!275741 Unit!12924)))

(assert (=> b!179598 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275749))) (currentByte!8895 (_2!8374 lt!275749)) (currentBit!8890 (_2!8374 lt!275749))) (bvsub (bvadd (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275729 () Unit!12888)

(declare-fun Unit!12925 () Unit!12888)

(assert (=> b!179598 (= lt!275729 Unit!12925)))

(declare-fun lt!275742 () Unit!12888)

(declare-fun Unit!12926 () Unit!12888)

(assert (=> b!179598 (= lt!275742 Unit!12926)))

(declare-fun lt!275714 () tuple2!15460)

(assert (=> b!179598 (= lt!275714 (reader!0 (_2!8374 lt!274772) (_2!8374 lt!275749)))))

(declare-fun lt!275702 () (_ BitVec 64))

(assert (=> b!179598 (= lt!275702 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!275719 () Unit!12888)

(assert (=> b!179598 (= lt!275719 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8374 lt!274772) (buf!4697 (_2!8374 lt!275749)) lt!275702))))

(assert (=> b!179598 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!275749)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772))) lt!275702)))

(declare-fun lt!275717 () Unit!12888)

(assert (=> b!179598 (= lt!275717 lt!275719)))

(declare-fun lt!275748 () tuple2!15474)

(assert (=> b!179598 (= lt!275748 (readNBitsLSBFirstsLoopPure!0 (_1!8375 lt!275714) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!149033 () Bool)

(assert (=> b!179598 (= res!149033 (= (_2!8382 lt!275748) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!124890 () Bool)

(assert (=> b!179598 (=> (not res!149033) (not e!124890))))

(assert (=> b!179598 e!124890))

(declare-fun lt!275740 () Unit!12888)

(declare-fun Unit!12927 () Unit!12888)

(assert (=> b!179598 (= lt!275740 Unit!12927)))

(declare-fun b!179599 () Bool)

(assert (=> b!179599 (= e!124891 (= (_1!8382 lt!275726) (_2!8375 lt!275713)))))

(declare-fun b!179600 () Bool)

(assert (=> b!179600 (= e!124888 (validate_offset_bits!1 ((_ sign_extend 32) (size!4254 (buf!4697 (_2!8374 lt!274772)))) ((_ sign_extend 32) (currentByte!8895 (_2!8374 lt!274772))) ((_ sign_extend 32) (currentBit!8890 (_2!8374 lt!274772))) lt!275715))))

(declare-fun d!62721 () Bool)

(assert (=> d!62721 e!124889))

(declare-fun res!149039 () Bool)

(assert (=> d!62721 (=> (not res!149039) (not e!124889))))

(assert (=> d!62721 (= res!149039 (invariant!0 (currentBit!8890 (_2!8374 lt!275716)) (currentByte!8895 (_2!8374 lt!275716)) (size!4254 (buf!4697 (_2!8374 lt!275716)))))))

(assert (=> d!62721 (= lt!275716 e!124893)))

(declare-fun c!9305 () Bool)

(assert (=> d!62721 (= c!9305 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!62721 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!62721 (= (appendBitsLSBFirstLoopTR!0 (_2!8374 lt!274772) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!275716)))

(declare-fun b!179594 () Bool)

(declare-fun Unit!12928 () Unit!12888)

(assert (=> b!179594 (= e!124893 (tuple2!15459 Unit!12928 (_2!8374 lt!274772)))))

(declare-fun lt!275718 () Unit!12888)

(assert (=> b!179594 (= lt!275718 (lemmaIsPrefixRefl!0 (_2!8374 lt!274772)))))

(assert (=> b!179594 call!2936))

(declare-fun lt!275723 () Unit!12888)

(assert (=> b!179594 (= lt!275723 lt!275718)))

(declare-fun b!179601 () Bool)

(declare-fun lt!275710 () tuple2!15462)

(assert (=> b!179601 (= lt!275710 (readBitPure!0 (readerFrom!0 (_2!8374 lt!275708) (currentBit!8890 (_2!8374 lt!274772)) (currentByte!8895 (_2!8374 lt!274772)))))))

(declare-fun res!149038 () Bool)

(assert (=> b!179601 (= res!149038 (and (= (_2!8376 lt!275710) lt!275751) (= (_1!8376 lt!275710) (_2!8374 lt!275708))))))

(declare-fun e!124894 () Bool)

(assert (=> b!179601 (=> (not res!149038) (not e!124894))))

(assert (=> b!179601 (= e!124887 e!124894)))

(declare-fun bm!2933 () Bool)

(assert (=> bm!2933 (= call!2936 (isPrefixOf!0 (_2!8374 lt!274772) (ite c!9305 (_2!8374 lt!274772) (_2!8374 lt!275749))))))

(declare-fun b!179602 () Bool)

(assert (=> b!179602 (= e!124892 (= (_2!8376 lt!275722) (_2!8376 lt!275735)))))

(declare-fun b!179603 () Bool)

(declare-fun res!149034 () Bool)

(assert (=> b!179603 (=> (not res!149034) (not e!124889))))

(assert (=> b!179603 (= res!149034 (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!275716)))))

(declare-fun b!179604 () Bool)

(assert (=> b!179604 (= e!124886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!179605 () Bool)

(declare-fun res!149029 () Bool)

(assert (=> b!179605 (= res!149029 (= (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275708))) (currentByte!8895 (_2!8374 lt!275708)) (currentBit!8890 (_2!8374 lt!275708))) (bvadd (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!179605 (=> (not res!149029) (not e!124887))))

(declare-fun b!179606 () Bool)

(assert (=> b!179606 (= e!124894 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!275710))) (currentByte!8895 (_1!8376 lt!275710)) (currentBit!8890 (_1!8376 lt!275710))) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!275708))) (currentByte!8895 (_2!8374 lt!275708)) (currentBit!8890 (_2!8374 lt!275708)))))))

(declare-fun b!179607 () Bool)

(declare-fun res!149037 () Bool)

(assert (=> b!179607 (=> (not res!149037) (not e!124889))))

(assert (=> b!179607 (= res!149037 (= (size!4254 (buf!4697 (_2!8374 lt!274772))) (size!4254 (buf!4697 (_2!8374 lt!275716)))))))

(declare-fun b!179608 () Bool)

(assert (=> b!179608 (= e!124890 (= (_1!8382 lt!275748) (_2!8375 lt!275714)))))

(assert (= (and d!62721 c!9305) b!179594))

(assert (= (and d!62721 (not c!9305)) b!179598))

(assert (= (and b!179598 res!149036) b!179605))

(assert (= (and b!179605 res!149029) b!179596))

(assert (= (and b!179596 res!149032) b!179601))

(assert (= (and b!179601 res!149038) b!179606))

(assert (= (and b!179598 res!149031) b!179602))

(assert (= (and b!179598 c!9306) b!179597))

(assert (= (and b!179598 (not c!9306)) b!179604))

(assert (= (and b!179598 res!149033) b!179608))

(assert (= (or b!179594 b!179598) bm!2933))

(assert (= (and d!62721 res!149039) b!179607))

(assert (= (and b!179607 res!149037) b!179595))

(assert (= (and b!179595 res!149035) b!179603))

(assert (= (and b!179603 res!149034) b!179593))

(assert (= (and b!179593 res!149030) b!179600))

(assert (= (and b!179593 res!149040) b!179599))

(declare-fun m!279903 () Bool)

(assert (=> b!179601 m!279903))

(assert (=> b!179601 m!279903))

(declare-fun m!279905 () Bool)

(assert (=> b!179601 m!279905))

(declare-fun m!279907 () Bool)

(assert (=> b!179596 m!279907))

(assert (=> b!179594 m!279553))

(declare-fun m!279909 () Bool)

(assert (=> b!179598 m!279909))

(declare-fun m!279911 () Bool)

(assert (=> b!179598 m!279911))

(assert (=> b!179598 m!279327))

(declare-fun m!279913 () Bool)

(assert (=> b!179598 m!279913))

(declare-fun m!279915 () Bool)

(assert (=> b!179598 m!279915))

(declare-fun m!279917 () Bool)

(assert (=> b!179598 m!279917))

(declare-fun m!279919 () Bool)

(assert (=> b!179598 m!279919))

(declare-fun m!279921 () Bool)

(assert (=> b!179598 m!279921))

(declare-fun m!279923 () Bool)

(assert (=> b!179598 m!279923))

(declare-fun m!279925 () Bool)

(assert (=> b!179598 m!279925))

(declare-fun m!279927 () Bool)

(assert (=> b!179598 m!279927))

(declare-fun m!279929 () Bool)

(assert (=> b!179598 m!279929))

(declare-fun m!279931 () Bool)

(assert (=> b!179598 m!279931))

(declare-fun m!279933 () Bool)

(assert (=> b!179598 m!279933))

(declare-fun m!279935 () Bool)

(assert (=> b!179598 m!279935))

(declare-fun m!279937 () Bool)

(assert (=> b!179598 m!279937))

(declare-fun m!279939 () Bool)

(assert (=> b!179598 m!279939))

(declare-fun m!279941 () Bool)

(assert (=> b!179598 m!279941))

(declare-fun m!279943 () Bool)

(assert (=> b!179598 m!279943))

(declare-fun m!279945 () Bool)

(assert (=> b!179598 m!279945))

(declare-fun m!279947 () Bool)

(assert (=> b!179598 m!279947))

(declare-fun m!279949 () Bool)

(assert (=> b!179598 m!279949))

(declare-fun m!279951 () Bool)

(assert (=> b!179598 m!279951))

(declare-fun m!279953 () Bool)

(assert (=> b!179598 m!279953))

(declare-fun m!279955 () Bool)

(assert (=> b!179598 m!279955))

(declare-fun m!279957 () Bool)

(assert (=> b!179598 m!279957))

(declare-fun m!279959 () Bool)

(assert (=> b!179598 m!279959))

(declare-fun m!279961 () Bool)

(assert (=> b!179598 m!279961))

(declare-fun m!279963 () Bool)

(assert (=> b!179598 m!279963))

(assert (=> b!179598 m!279953))

(declare-fun m!279965 () Bool)

(assert (=> b!179598 m!279965))

(declare-fun m!279967 () Bool)

(assert (=> b!179598 m!279967))

(declare-fun m!279969 () Bool)

(assert (=> b!179598 m!279969))

(declare-fun m!279971 () Bool)

(assert (=> b!179598 m!279971))

(declare-fun m!279973 () Bool)

(assert (=> d!62721 m!279973))

(declare-fun m!279975 () Bool)

(assert (=> b!179603 m!279975))

(assert (=> b!179593 m!279937))

(declare-fun m!279977 () Bool)

(assert (=> b!179593 m!279977))

(assert (=> b!179593 m!279913))

(declare-fun m!279979 () Bool)

(assert (=> b!179593 m!279979))

(declare-fun m!279981 () Bool)

(assert (=> b!179593 m!279981))

(declare-fun m!279983 () Bool)

(assert (=> b!179593 m!279983))

(declare-fun m!279985 () Bool)

(assert (=> b!179600 m!279985))

(declare-fun m!279987 () Bool)

(assert (=> b!179595 m!279987))

(assert (=> b!179595 m!279327))

(declare-fun m!279989 () Bool)

(assert (=> b!179605 m!279989))

(assert (=> b!179605 m!279327))

(declare-fun m!279991 () Bool)

(assert (=> b!179606 m!279991))

(assert (=> b!179606 m!279989))

(declare-fun m!279993 () Bool)

(assert (=> bm!2933 m!279993))

(assert (=> b!179252 d!62721))

(declare-fun d!62795 () Bool)

(declare-fun res!149041 () Bool)

(declare-fun e!124896 () Bool)

(assert (=> d!62795 (=> (not res!149041) (not e!124896))))

(assert (=> d!62795 (= res!149041 (= (size!4254 (buf!4697 (_2!8374 lt!274772))) (size!4254 (buf!4697 (_2!8374 lt!274770)))))))

(assert (=> d!62795 (= (isPrefixOf!0 (_2!8374 lt!274772) (_2!8374 lt!274770)) e!124896)))

(declare-fun b!179609 () Bool)

(declare-fun res!149042 () Bool)

(assert (=> b!179609 (=> (not res!149042) (not e!124896))))

(assert (=> b!179609 (= res!149042 (bvsle (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772))) (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274770))) (currentByte!8895 (_2!8374 lt!274770)) (currentBit!8890 (_2!8374 lt!274770)))))))

(declare-fun b!179610 () Bool)

(declare-fun e!124895 () Bool)

(assert (=> b!179610 (= e!124896 e!124895)))

(declare-fun res!149043 () Bool)

(assert (=> b!179610 (=> res!149043 e!124895)))

(assert (=> b!179610 (= res!149043 (= (size!4254 (buf!4697 (_2!8374 lt!274772))) #b00000000000000000000000000000000))))

(declare-fun b!179611 () Bool)

(assert (=> b!179611 (= e!124895 (arrayBitRangesEq!0 (buf!4697 (_2!8374 lt!274772)) (buf!4697 (_2!8374 lt!274770)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4254 (buf!4697 (_2!8374 lt!274772))) (currentByte!8895 (_2!8374 lt!274772)) (currentBit!8890 (_2!8374 lt!274772)))))))

(assert (= (and d!62795 res!149041) b!179609))

(assert (= (and b!179609 res!149042) b!179610))

(assert (= (and b!179610 (not res!149043)) b!179611))

(assert (=> b!179609 m!279327))

(assert (=> b!179609 m!279363))

(assert (=> b!179611 m!279327))

(assert (=> b!179611 m!279327))

(declare-fun m!279995 () Bool)

(assert (=> b!179611 m!279995))

(assert (=> b!179253 d!62795))

(declare-fun d!62797 () Bool)

(declare-fun lt!275753 () tuple2!15472)

(assert (=> d!62797 (= lt!275753 (readBit!0 (readerFrom!0 (_2!8374 lt!274772) (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204))))))

(assert (=> d!62797 (= (readBitPure!0 (readerFrom!0 (_2!8374 lt!274772) (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204))) (tuple2!15463 (_2!8381 lt!275753) (_1!8381 lt!275753)))))

(declare-fun bs!15648 () Bool)

(assert (= bs!15648 d!62797))

(assert (=> bs!15648 m!279333))

(declare-fun m!279997 () Bool)

(assert (=> bs!15648 m!279997))

(assert (=> b!179260 d!62797))

(declare-fun d!62799 () Bool)

(declare-fun e!124899 () Bool)

(assert (=> d!62799 e!124899))

(declare-fun res!149047 () Bool)

(assert (=> d!62799 (=> (not res!149047) (not e!124899))))

(assert (=> d!62799 (= res!149047 (invariant!0 (currentBit!8890 (_2!8374 lt!274772)) (currentByte!8895 (_2!8374 lt!274772)) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (=> d!62799 (= (readerFrom!0 (_2!8374 lt!274772) (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204)) (BitStream!7617 (buf!4697 (_2!8374 lt!274772)) (currentByte!8895 thiss!1204) (currentBit!8890 thiss!1204)))))

(declare-fun b!179614 () Bool)

(assert (=> b!179614 (= e!124899 (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 (_2!8374 lt!274772)))))))

(assert (= (and d!62799 res!149047) b!179614))

(assert (=> d!62799 m!279561))

(assert (=> b!179614 m!279341))

(assert (=> b!179260 d!62799))

(declare-fun d!62801 () Bool)

(assert (=> d!62801 (= (invariant!0 (currentBit!8890 thiss!1204) (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204))) (and (bvsge (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8890 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8895 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204))) (and (= (currentBit!8890 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8895 thiss!1204) (size!4254 (buf!4697 thiss!1204)))))))))

(assert (=> b!179250 d!62801))

(assert (=> b!179261 d!62709))

(assert (=> b!179261 d!62711))

(declare-fun d!62803 () Bool)

(declare-fun e!124900 () Bool)

(assert (=> d!62803 e!124900))

(declare-fun res!149049 () Bool)

(assert (=> d!62803 (=> (not res!149049) (not e!124900))))

(declare-fun lt!275755 () (_ BitVec 64))

(declare-fun lt!275757 () (_ BitVec 64))

(declare-fun lt!275759 () (_ BitVec 64))

(assert (=> d!62803 (= res!149049 (= lt!275755 (bvsub lt!275759 lt!275757)))))

(assert (=> d!62803 (or (= (bvand lt!275759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!275757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!275759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!275759 lt!275757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62803 (= lt!275757 (remainingBits!0 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274768)))) ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274768))) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274768)))))))

(declare-fun lt!275758 () (_ BitVec 64))

(declare-fun lt!275754 () (_ BitVec 64))

(assert (=> d!62803 (= lt!275759 (bvmul lt!275758 lt!275754))))

(assert (=> d!62803 (or (= lt!275758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!275754 (bvsdiv (bvmul lt!275758 lt!275754) lt!275758)))))

(assert (=> d!62803 (= lt!275754 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62803 (= lt!275758 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274768)))))))

(assert (=> d!62803 (= lt!275755 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8895 (_1!8376 lt!274768))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8890 (_1!8376 lt!274768)))))))

(assert (=> d!62803 (invariant!0 (currentBit!8890 (_1!8376 lt!274768)) (currentByte!8895 (_1!8376 lt!274768)) (size!4254 (buf!4697 (_1!8376 lt!274768))))))

(assert (=> d!62803 (= (bitIndex!0 (size!4254 (buf!4697 (_1!8376 lt!274768))) (currentByte!8895 (_1!8376 lt!274768)) (currentBit!8890 (_1!8376 lt!274768))) lt!275755)))

(declare-fun b!179615 () Bool)

(declare-fun res!149048 () Bool)

(assert (=> b!179615 (=> (not res!149048) (not e!124900))))

(assert (=> b!179615 (= res!149048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!275755))))

(declare-fun b!179616 () Bool)

(declare-fun lt!275756 () (_ BitVec 64))

(assert (=> b!179616 (= e!124900 (bvsle lt!275755 (bvmul lt!275756 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!179616 (or (= lt!275756 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!275756 #b0000000000000000000000000000000000000000000000000000000000001000) lt!275756)))))

(assert (=> b!179616 (= lt!275756 ((_ sign_extend 32) (size!4254 (buf!4697 (_1!8376 lt!274768)))))))

(assert (= (and d!62803 res!149049) b!179615))

(assert (= (and b!179615 res!149048) b!179616))

(declare-fun m!279999 () Bool)

(assert (=> d!62803 m!279999))

(declare-fun m!280001 () Bool)

(assert (=> d!62803 m!280001))

(assert (=> b!179251 d!62803))

(assert (=> b!179262 d!62707))

(push 1)

(assert (not b!179606))

(assert (not d!62711))

(assert (not b!179603))

(assert (not b!179383))

(assert (not b!179595))

(assert (not d!62699))

(assert (not d!62703))

(assert (not b!179594))

(assert (not b!179349))

(assert (not d!62665))

(assert (not d!62685))

(assert (not d!62673))

(assert (not b!179344))

(assert (not b!179346))

(assert (not b!179375))

(assert (not b!179598))

(assert (not d!62797))

(assert (not d!62697))

(assert (not b!179348))

(assert (not b!179596))

(assert (not d!62715))

(assert (not d!62669))

(assert (not b!179351))

(assert (not b!179343))

(assert (not b!179359))

(assert (not b!179345))

(assert (not d!62719))

(assert (not b!179376))

(assert (not d!62667))

(assert (not b!179377))

(assert (not b!179600))

(assert (not b!179381))

(assert (not b!179601))

(assert (not bm!2933))

(assert (not b!179378))

(assert (not d!62709))

(assert (not b!179605))

(assert (not b!179593))

(assert (not d!62687))

(assert (not b!179614))

(assert (not d!62661))

(assert (not b!179609))

(assert (not b!179361))

(assert (not d!62721))

(assert (not d!62803))

(assert (not b!179611))

(assert (not d!62713))

(assert (not d!62799))

(assert (not b!179350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

