; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18318 () Bool)

(assert start!18318)

(declare-fun b!90841 () Bool)

(declare-fun e!59776 () Bool)

(declare-datatypes ((array!4253 0))(
  ( (array!4254 (arr!2554 (Array (_ BitVec 32) (_ BitVec 8))) (size!1917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3396 0))(
  ( (BitStream!3397 (buf!2307 array!4253) (currentByte!4588 (_ BitVec 32)) (currentBit!4583 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3396)

(declare-fun array_inv!1763 (array!4253) Bool)

(assert (=> b!90841 (= e!59776 (array_inv!1763 (buf!2307 thiss!1151)))))

(declare-fun b!90842 () Bool)

(declare-fun e!59770 () Bool)

(declare-datatypes ((tuple2!7562 0))(
  ( (tuple2!7563 (_1!4026 BitStream!3396) (_2!4026 Bool)) )
))
(declare-fun lt!137432 () tuple2!7562)

(declare-fun lt!137434 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90842 (= e!59770 (= (bitIndex!0 (size!1917 (buf!2307 (_1!4026 lt!137432))) (currentByte!4588 (_1!4026 lt!137432)) (currentBit!4583 (_1!4026 lt!137432))) lt!137434))))

(declare-fun b!90843 () Bool)

(declare-fun res!74943 () Bool)

(declare-fun e!59777 () Bool)

(assert (=> b!90843 (=> (not res!74943) (not e!59777))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90843 (= res!74943 (invariant!0 (currentBit!4583 thiss!1151) (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151))))))

(declare-fun b!90844 () Bool)

(declare-fun res!74948 () Bool)

(declare-fun e!59771 () Bool)

(assert (=> b!90844 (=> (not res!74948) (not e!59771))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!90844 (= res!74948 (bvslt i!576 nBits!336))))

(declare-datatypes ((Unit!5826 0))(
  ( (Unit!5827) )
))
(declare-datatypes ((tuple2!7564 0))(
  ( (tuple2!7565 (_1!4027 Unit!5826) (_2!4027 BitStream!3396)) )
))
(declare-fun lt!137435 () tuple2!7564)

(declare-fun lt!137436 () (_ BitVec 64))

(declare-fun e!59769 () Bool)

(declare-fun b!90845 () Bool)

(assert (=> b!90845 (= e!59769 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1917 (buf!2307 (_2!4027 lt!137435))) (size!1917 (buf!2307 thiss!1151)))) (let ((bdg!4255 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) (let ((bdg!4256 (bvand lt!137436 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4256 (bvand bdg!4255 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4256 (bvand (bvadd lt!137436 bdg!4255) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!90846 () Bool)

(declare-fun res!74945 () Bool)

(assert (=> b!90846 (=> (not res!74945) (not e!59777))))

(declare-fun thiss!1152 () BitStream!3396)

(assert (=> b!90846 (= res!74945 (and (bvsle i!576 nBits!336) (= (size!1917 (buf!2307 thiss!1152)) (size!1917 (buf!2307 thiss!1151)))))))

(declare-fun b!90847 () Bool)

(declare-fun e!59778 () Bool)

(assert (=> b!90847 (= e!59778 (array_inv!1763 (buf!2307 thiss!1152)))))

(declare-fun res!74944 () Bool)

(assert (=> start!18318 (=> (not res!74944) (not e!59777))))

(assert (=> start!18318 (= res!74944 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18318 e!59777))

(declare-fun inv!12 (BitStream!3396) Bool)

(assert (=> start!18318 (and (inv!12 thiss!1152) e!59778)))

(assert (=> start!18318 (and (inv!12 thiss!1151) e!59776)))

(assert (=> start!18318 true))

(declare-fun b!90848 () Bool)

(declare-fun res!74949 () Bool)

(declare-fun e!59775 () Bool)

(assert (=> b!90848 (=> (not res!74949) (not e!59775))))

(declare-fun isPrefixOf!0 (BitStream!3396 BitStream!3396) Bool)

(assert (=> b!90848 (= res!74949 (isPrefixOf!0 thiss!1152 (_2!4027 lt!137435)))))

(declare-fun b!90849 () Bool)

(declare-fun res!74941 () Bool)

(assert (=> b!90849 (=> (not res!74941) (not e!59777))))

(assert (=> b!90849 (= res!74941 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90850 () Bool)

(declare-fun res!74950 () Bool)

(assert (=> b!90850 (=> (not res!74950) (not e!59777))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90850 (= res!74950 (validate_offset_bits!1 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))) ((_ sign_extend 32) (currentByte!4588 thiss!1151)) ((_ sign_extend 32) (currentBit!4583 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90851 () Bool)

(declare-fun e!59772 () Bool)

(assert (=> b!90851 (= e!59772 e!59775)))

(declare-fun res!74953 () Bool)

(assert (=> b!90851 (=> (not res!74953) (not e!59775))))

(declare-fun lt!137431 () (_ BitVec 64))

(assert (=> b!90851 (= res!74953 (= lt!137434 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137431)))))

(assert (=> b!90851 (= lt!137434 (bitIndex!0 (size!1917 (buf!2307 (_2!4027 lt!137435))) (currentByte!4588 (_2!4027 lt!137435)) (currentBit!4583 (_2!4027 lt!137435))))))

(declare-fun b!90852 () Bool)

(assert (=> b!90852 (= e!59777 e!59771)))

(declare-fun res!74952 () Bool)

(assert (=> b!90852 (=> (not res!74952) (not e!59771))))

(assert (=> b!90852 (= res!74952 (= lt!137431 (bvadd lt!137436 ((_ sign_extend 32) i!576))))))

(assert (=> b!90852 (= lt!137431 (bitIndex!0 (size!1917 (buf!2307 thiss!1152)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152)))))

(assert (=> b!90852 (= lt!137436 (bitIndex!0 (size!1917 (buf!2307 thiss!1151)) (currentByte!4588 thiss!1151) (currentBit!4583 thiss!1151)))))

(declare-fun b!90853 () Bool)

(assert (=> b!90853 (= e!59771 (not e!59769))))

(declare-fun res!74947 () Bool)

(assert (=> b!90853 (=> res!74947 e!59769)))

(assert (=> b!90853 (= res!74947 (not (invariant!0 (currentBit!4583 (_2!4027 lt!137435)) (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435))))))))

(assert (=> b!90853 e!59772))

(declare-fun res!74942 () Bool)

(assert (=> b!90853 (=> (not res!74942) (not e!59772))))

(assert (=> b!90853 (= res!74942 (= (size!1917 (buf!2307 thiss!1152)) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(declare-fun lt!137433 () Bool)

(declare-fun appendBit!0 (BitStream!3396 Bool) tuple2!7564)

(assert (=> b!90853 (= lt!137435 (appendBit!0 thiss!1152 lt!137433))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!90853 (= lt!137433 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90854 () Bool)

(assert (=> b!90854 (= e!59775 e!59770)))

(declare-fun res!74951 () Bool)

(assert (=> b!90854 (=> (not res!74951) (not e!59770))))

(assert (=> b!90854 (= res!74951 (and (= (_2!4026 lt!137432) lt!137433) (= (_1!4026 lt!137432) (_2!4027 lt!137435))))))

(declare-fun readBitPure!0 (BitStream!3396) tuple2!7562)

(declare-fun readerFrom!0 (BitStream!3396 (_ BitVec 32) (_ BitVec 32)) BitStream!3396)

(assert (=> b!90854 (= lt!137432 (readBitPure!0 (readerFrom!0 (_2!4027 lt!137435) (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152))))))

(declare-fun b!90855 () Bool)

(declare-fun res!74946 () Bool)

(assert (=> b!90855 (=> (not res!74946) (not e!59771))))

(assert (=> b!90855 (= res!74946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))) ((_ sign_extend 32) (currentByte!4588 thiss!1152)) ((_ sign_extend 32) (currentBit!4583 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90856 () Bool)

(declare-fun res!74940 () Bool)

(assert (=> b!90856 (=> (not res!74940) (not e!59777))))

(assert (=> b!90856 (= res!74940 (invariant!0 (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152))))))

(assert (= (and start!18318 res!74944) b!90850))

(assert (= (and b!90850 res!74950) b!90843))

(assert (= (and b!90843 res!74943) b!90849))

(assert (= (and b!90849 res!74941) b!90856))

(assert (= (and b!90856 res!74940) b!90846))

(assert (= (and b!90846 res!74945) b!90852))

(assert (= (and b!90852 res!74952) b!90855))

(assert (= (and b!90855 res!74946) b!90844))

(assert (= (and b!90844 res!74948) b!90853))

(assert (= (and b!90853 res!74942) b!90851))

(assert (= (and b!90851 res!74953) b!90848))

(assert (= (and b!90848 res!74949) b!90854))

(assert (= (and b!90854 res!74951) b!90842))

(assert (= (and b!90853 (not res!74947)) b!90845))

(assert (= start!18318 b!90847))

(assert (= start!18318 b!90841))

(declare-fun m!135171 () Bool)

(assert (=> b!90848 m!135171))

(declare-fun m!135173 () Bool)

(assert (=> b!90850 m!135173))

(declare-fun m!135175 () Bool)

(assert (=> b!90854 m!135175))

(assert (=> b!90854 m!135175))

(declare-fun m!135177 () Bool)

(assert (=> b!90854 m!135177))

(declare-fun m!135179 () Bool)

(assert (=> b!90856 m!135179))

(declare-fun m!135181 () Bool)

(assert (=> b!90843 m!135181))

(declare-fun m!135183 () Bool)

(assert (=> b!90852 m!135183))

(declare-fun m!135185 () Bool)

(assert (=> b!90852 m!135185))

(declare-fun m!135187 () Bool)

(assert (=> b!90842 m!135187))

(declare-fun m!135189 () Bool)

(assert (=> b!90841 m!135189))

(declare-fun m!135191 () Bool)

(assert (=> b!90853 m!135191))

(declare-fun m!135193 () Bool)

(assert (=> b!90853 m!135193))

(declare-fun m!135195 () Bool)

(assert (=> start!18318 m!135195))

(declare-fun m!135197 () Bool)

(assert (=> start!18318 m!135197))

(declare-fun m!135199 () Bool)

(assert (=> b!90851 m!135199))

(declare-fun m!135201 () Bool)

(assert (=> b!90855 m!135201))

(declare-fun m!135203 () Bool)

(assert (=> b!90847 m!135203))

(check-sat (not b!90853) (not b!90854) (not start!18318) (not b!90852) (not b!90841) (not b!90842) (not b!90855) (not b!90851) (not b!90850) (not b!90848) (not b!90847) (not b!90843) (not b!90856))
(check-sat)
(get-model)

(declare-fun d!28264 () Bool)

(declare-fun res!75004 () Bool)

(declare-fun e!59814 () Bool)

(assert (=> d!28264 (=> (not res!75004) (not e!59814))))

(assert (=> d!28264 (= res!75004 (= (size!1917 (buf!2307 thiss!1152)) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(assert (=> d!28264 (= (isPrefixOf!0 thiss!1152 (_2!4027 lt!137435)) e!59814)))

(declare-fun b!90911 () Bool)

(declare-fun res!75002 () Bool)

(assert (=> b!90911 (=> (not res!75002) (not e!59814))))

(assert (=> b!90911 (= res!75002 (bvsle (bitIndex!0 (size!1917 (buf!2307 thiss!1152)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152)) (bitIndex!0 (size!1917 (buf!2307 (_2!4027 lt!137435))) (currentByte!4588 (_2!4027 lt!137435)) (currentBit!4583 (_2!4027 lt!137435)))))))

(declare-fun b!90912 () Bool)

(declare-fun e!59813 () Bool)

(assert (=> b!90912 (= e!59814 e!59813)))

(declare-fun res!75003 () Bool)

(assert (=> b!90912 (=> res!75003 e!59813)))

(assert (=> b!90912 (= res!75003 (= (size!1917 (buf!2307 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90913 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4253 array!4253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90913 (= e!59813 (arrayBitRangesEq!0 (buf!2307 thiss!1152) (buf!2307 (_2!4027 lt!137435)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1917 (buf!2307 thiss!1152)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152))))))

(assert (= (and d!28264 res!75004) b!90911))

(assert (= (and b!90911 res!75002) b!90912))

(assert (= (and b!90912 (not res!75003)) b!90913))

(assert (=> b!90911 m!135183))

(assert (=> b!90911 m!135199))

(assert (=> b!90913 m!135183))

(assert (=> b!90913 m!135183))

(declare-fun m!135239 () Bool)

(assert (=> b!90913 m!135239))

(assert (=> b!90848 d!28264))

(declare-fun d!28266 () Bool)

(assert (=> d!28266 (= (array_inv!1763 (buf!2307 thiss!1152)) (bvsge (size!1917 (buf!2307 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90847 d!28266))

(declare-fun d!28268 () Bool)

(declare-fun e!59817 () Bool)

(assert (=> d!28268 e!59817))

(declare-fun res!75009 () Bool)

(assert (=> d!28268 (=> (not res!75009) (not e!59817))))

(declare-fun lt!137472 () (_ BitVec 64))

(declare-fun lt!137469 () (_ BitVec 64))

(declare-fun lt!137467 () (_ BitVec 64))

(assert (=> d!28268 (= res!75009 (= lt!137469 (bvsub lt!137472 lt!137467)))))

(assert (=> d!28268 (or (= (bvand lt!137472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137472 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137472 lt!137467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28268 (= lt!137467 (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 (_2!4027 lt!137435)))) ((_ sign_extend 32) (currentByte!4588 (_2!4027 lt!137435))) ((_ sign_extend 32) (currentBit!4583 (_2!4027 lt!137435)))))))

(declare-fun lt!137471 () (_ BitVec 64))

(declare-fun lt!137468 () (_ BitVec 64))

(assert (=> d!28268 (= lt!137472 (bvmul lt!137471 lt!137468))))

(assert (=> d!28268 (or (= lt!137471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137468 (bvsdiv (bvmul lt!137471 lt!137468) lt!137471)))))

(assert (=> d!28268 (= lt!137468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28268 (= lt!137471 ((_ sign_extend 32) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(assert (=> d!28268 (= lt!137469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4588 (_2!4027 lt!137435))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4583 (_2!4027 lt!137435)))))))

(assert (=> d!28268 (invariant!0 (currentBit!4583 (_2!4027 lt!137435)) (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435))))))

(assert (=> d!28268 (= (bitIndex!0 (size!1917 (buf!2307 (_2!4027 lt!137435))) (currentByte!4588 (_2!4027 lt!137435)) (currentBit!4583 (_2!4027 lt!137435))) lt!137469)))

(declare-fun b!90918 () Bool)

(declare-fun res!75010 () Bool)

(assert (=> b!90918 (=> (not res!75010) (not e!59817))))

(assert (=> b!90918 (= res!75010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137469))))

(declare-fun b!90919 () Bool)

(declare-fun lt!137470 () (_ BitVec 64))

(assert (=> b!90919 (= e!59817 (bvsle lt!137469 (bvmul lt!137470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90919 (or (= lt!137470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137470)))))

(assert (=> b!90919 (= lt!137470 ((_ sign_extend 32) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(assert (= (and d!28268 res!75009) b!90918))

(assert (= (and b!90918 res!75010) b!90919))

(declare-fun m!135241 () Bool)

(assert (=> d!28268 m!135241))

(assert (=> d!28268 m!135191))

(assert (=> b!90851 d!28268))

(declare-fun d!28270 () Bool)

(assert (=> d!28270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))) ((_ sign_extend 32) (currentByte!4588 thiss!1151)) ((_ sign_extend 32) (currentBit!4583 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))) ((_ sign_extend 32) (currentByte!4588 thiss!1151)) ((_ sign_extend 32) (currentBit!4583 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6986 () Bool)

(assert (= bs!6986 d!28270))

(declare-fun m!135243 () Bool)

(assert (=> bs!6986 m!135243))

(assert (=> b!90850 d!28270))

(declare-fun d!28274 () Bool)

(assert (=> d!28274 (= (invariant!0 (currentBit!4583 thiss!1151) (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151))) (and (bvsge (currentBit!4583 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4583 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4588 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151))) (and (= (currentBit!4583 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151)))))))))

(assert (=> b!90843 d!28274))

(declare-fun d!28278 () Bool)

(declare-datatypes ((tuple2!7570 0))(
  ( (tuple2!7571 (_1!4030 Bool) (_2!4030 BitStream!3396)) )
))
(declare-fun lt!137475 () tuple2!7570)

(declare-fun readBit!0 (BitStream!3396) tuple2!7570)

(assert (=> d!28278 (= lt!137475 (readBit!0 (readerFrom!0 (_2!4027 lt!137435) (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152))))))

(assert (=> d!28278 (= (readBitPure!0 (readerFrom!0 (_2!4027 lt!137435) (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152))) (tuple2!7563 (_2!4030 lt!137475) (_1!4030 lt!137475)))))

(declare-fun bs!6987 () Bool)

(assert (= bs!6987 d!28278))

(assert (=> bs!6987 m!135175))

(declare-fun m!135245 () Bool)

(assert (=> bs!6987 m!135245))

(assert (=> b!90854 d!28278))

(declare-fun d!28282 () Bool)

(declare-fun e!59820 () Bool)

(assert (=> d!28282 e!59820))

(declare-fun res!75014 () Bool)

(assert (=> d!28282 (=> (not res!75014) (not e!59820))))

(assert (=> d!28282 (= res!75014 (invariant!0 (currentBit!4583 (_2!4027 lt!137435)) (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(assert (=> d!28282 (= (readerFrom!0 (_2!4027 lt!137435) (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152)) (BitStream!3397 (buf!2307 (_2!4027 lt!137435)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152)))))

(declare-fun b!90922 () Bool)

(assert (=> b!90922 (= e!59820 (invariant!0 (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152) (size!1917 (buf!2307 (_2!4027 lt!137435)))))))

(assert (= (and d!28282 res!75014) b!90922))

(assert (=> d!28282 m!135191))

(declare-fun m!135247 () Bool)

(assert (=> b!90922 m!135247))

(assert (=> b!90854 d!28282))

(declare-fun d!28284 () Bool)

(assert (=> d!28284 (= (invariant!0 (currentBit!4583 (_2!4027 lt!137435)) (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435)))) (and (bvsge (currentBit!4583 (_2!4027 lt!137435)) #b00000000000000000000000000000000) (bvslt (currentBit!4583 (_2!4027 lt!137435)) #b00000000000000000000000000001000) (bvsge (currentByte!4588 (_2!4027 lt!137435)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435)))) (and (= (currentBit!4583 (_2!4027 lt!137435)) #b00000000000000000000000000000000) (= (currentByte!4588 (_2!4027 lt!137435)) (size!1917 (buf!2307 (_2!4027 lt!137435))))))))))

(assert (=> b!90853 d!28284))

(declare-fun b!90960 () Bool)

(declare-fun e!59840 () Bool)

(declare-fun e!59839 () Bool)

(assert (=> b!90960 (= e!59840 e!59839)))

(declare-fun res!75050 () Bool)

(assert (=> b!90960 (=> (not res!75050) (not e!59839))))

(declare-fun lt!137540 () tuple2!7562)

(declare-fun lt!137537 () tuple2!7564)

(assert (=> b!90960 (= res!75050 (and (= (_2!4026 lt!137540) lt!137433) (= (_1!4026 lt!137540) (_2!4027 lt!137537))))))

(assert (=> b!90960 (= lt!137540 (readBitPure!0 (readerFrom!0 (_2!4027 lt!137537) (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152))))))

(declare-fun b!90958 () Bool)

(declare-fun res!75049 () Bool)

(assert (=> b!90958 (=> (not res!75049) (not e!59840))))

(declare-fun lt!137538 () (_ BitVec 64))

(declare-fun lt!137539 () (_ BitVec 64))

(assert (=> b!90958 (= res!75049 (= (bitIndex!0 (size!1917 (buf!2307 (_2!4027 lt!137537))) (currentByte!4588 (_2!4027 lt!137537)) (currentBit!4583 (_2!4027 lt!137537))) (bvadd lt!137538 lt!137539)))))

(assert (=> b!90958 (or (not (= (bvand lt!137538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137539 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137538 lt!137539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90958 (= lt!137539 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90958 (= lt!137538 (bitIndex!0 (size!1917 (buf!2307 thiss!1152)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152)))))

(declare-fun b!90959 () Bool)

(declare-fun res!75052 () Bool)

(assert (=> b!90959 (=> (not res!75052) (not e!59840))))

(assert (=> b!90959 (= res!75052 (isPrefixOf!0 thiss!1152 (_2!4027 lt!137537)))))

(declare-fun d!28286 () Bool)

(assert (=> d!28286 e!59840))

(declare-fun res!75051 () Bool)

(assert (=> d!28286 (=> (not res!75051) (not e!59840))))

(assert (=> d!28286 (= res!75051 (= (size!1917 (buf!2307 thiss!1152)) (size!1917 (buf!2307 (_2!4027 lt!137537)))))))

(declare-fun choose!16 (BitStream!3396 Bool) tuple2!7564)

(assert (=> d!28286 (= lt!137537 (choose!16 thiss!1152 lt!137433))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28286 (validate_offset_bit!0 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))) ((_ sign_extend 32) (currentByte!4588 thiss!1152)) ((_ sign_extend 32) (currentBit!4583 thiss!1152)))))

(assert (=> d!28286 (= (appendBit!0 thiss!1152 lt!137433) lt!137537)))

(declare-fun b!90961 () Bool)

(assert (=> b!90961 (= e!59839 (= (bitIndex!0 (size!1917 (buf!2307 (_1!4026 lt!137540))) (currentByte!4588 (_1!4026 lt!137540)) (currentBit!4583 (_1!4026 lt!137540))) (bitIndex!0 (size!1917 (buf!2307 (_2!4027 lt!137537))) (currentByte!4588 (_2!4027 lt!137537)) (currentBit!4583 (_2!4027 lt!137537)))))))

(assert (= (and d!28286 res!75051) b!90958))

(assert (= (and b!90958 res!75049) b!90959))

(assert (= (and b!90959 res!75052) b!90960))

(assert (= (and b!90960 res!75050) b!90961))

(declare-fun m!135263 () Bool)

(assert (=> b!90960 m!135263))

(assert (=> b!90960 m!135263))

(declare-fun m!135265 () Bool)

(assert (=> b!90960 m!135265))

(declare-fun m!135267 () Bool)

(assert (=> b!90959 m!135267))

(declare-fun m!135269 () Bool)

(assert (=> b!90961 m!135269))

(declare-fun m!135271 () Bool)

(assert (=> b!90961 m!135271))

(assert (=> b!90958 m!135271))

(assert (=> b!90958 m!135183))

(declare-fun m!135273 () Bool)

(assert (=> d!28286 m!135273))

(declare-fun m!135275 () Bool)

(assert (=> d!28286 m!135275))

(assert (=> b!90853 d!28286))

(declare-fun d!28312 () Bool)

(declare-fun e!59847 () Bool)

(assert (=> d!28312 e!59847))

(declare-fun res!75063 () Bool)

(assert (=> d!28312 (=> (not res!75063) (not e!59847))))

(declare-fun lt!137547 () (_ BitVec 64))

(declare-fun lt!137545 () (_ BitVec 64))

(declare-fun lt!137550 () (_ BitVec 64))

(assert (=> d!28312 (= res!75063 (= lt!137547 (bvsub lt!137550 lt!137545)))))

(assert (=> d!28312 (or (= (bvand lt!137550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137550 lt!137545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28312 (= lt!137545 (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 (_1!4026 lt!137432)))) ((_ sign_extend 32) (currentByte!4588 (_1!4026 lt!137432))) ((_ sign_extend 32) (currentBit!4583 (_1!4026 lt!137432)))))))

(declare-fun lt!137549 () (_ BitVec 64))

(declare-fun lt!137546 () (_ BitVec 64))

(assert (=> d!28312 (= lt!137550 (bvmul lt!137549 lt!137546))))

(assert (=> d!28312 (or (= lt!137549 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137546 (bvsdiv (bvmul lt!137549 lt!137546) lt!137549)))))

(assert (=> d!28312 (= lt!137546 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28312 (= lt!137549 ((_ sign_extend 32) (size!1917 (buf!2307 (_1!4026 lt!137432)))))))

(assert (=> d!28312 (= lt!137547 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4588 (_1!4026 lt!137432))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4583 (_1!4026 lt!137432)))))))

(assert (=> d!28312 (invariant!0 (currentBit!4583 (_1!4026 lt!137432)) (currentByte!4588 (_1!4026 lt!137432)) (size!1917 (buf!2307 (_1!4026 lt!137432))))))

(assert (=> d!28312 (= (bitIndex!0 (size!1917 (buf!2307 (_1!4026 lt!137432))) (currentByte!4588 (_1!4026 lt!137432)) (currentBit!4583 (_1!4026 lt!137432))) lt!137547)))

(declare-fun b!90972 () Bool)

(declare-fun res!75064 () Bool)

(assert (=> b!90972 (=> (not res!75064) (not e!59847))))

(assert (=> b!90972 (= res!75064 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137547))))

(declare-fun b!90973 () Bool)

(declare-fun lt!137548 () (_ BitVec 64))

(assert (=> b!90973 (= e!59847 (bvsle lt!137547 (bvmul lt!137548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90973 (or (= lt!137548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137548)))))

(assert (=> b!90973 (= lt!137548 ((_ sign_extend 32) (size!1917 (buf!2307 (_1!4026 lt!137432)))))))

(assert (= (and d!28312 res!75063) b!90972))

(assert (= (and b!90972 res!75064) b!90973))

(declare-fun m!135277 () Bool)

(assert (=> d!28312 m!135277))

(declare-fun m!135281 () Bool)

(assert (=> d!28312 m!135281))

(assert (=> b!90842 d!28312))

(declare-fun d!28314 () Bool)

(assert (=> d!28314 (= (array_inv!1763 (buf!2307 thiss!1151)) (bvsge (size!1917 (buf!2307 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90841 d!28314))

(declare-fun d!28316 () Bool)

(declare-fun e!59848 () Bool)

(assert (=> d!28316 e!59848))

(declare-fun res!75065 () Bool)

(assert (=> d!28316 (=> (not res!75065) (not e!59848))))

(declare-fun lt!137551 () (_ BitVec 64))

(declare-fun lt!137556 () (_ BitVec 64))

(declare-fun lt!137553 () (_ BitVec 64))

(assert (=> d!28316 (= res!75065 (= lt!137553 (bvsub lt!137556 lt!137551)))))

(assert (=> d!28316 (or (= (bvand lt!137556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137551 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137556 lt!137551) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28316 (= lt!137551 (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))) ((_ sign_extend 32) (currentByte!4588 thiss!1152)) ((_ sign_extend 32) (currentBit!4583 thiss!1152))))))

(declare-fun lt!137555 () (_ BitVec 64))

(declare-fun lt!137552 () (_ BitVec 64))

(assert (=> d!28316 (= lt!137556 (bvmul lt!137555 lt!137552))))

(assert (=> d!28316 (or (= lt!137555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137552 (bvsdiv (bvmul lt!137555 lt!137552) lt!137555)))))

(assert (=> d!28316 (= lt!137552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28316 (= lt!137555 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))))))

(assert (=> d!28316 (= lt!137553 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4588 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4583 thiss!1152))))))

(assert (=> d!28316 (invariant!0 (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152)))))

(assert (=> d!28316 (= (bitIndex!0 (size!1917 (buf!2307 thiss!1152)) (currentByte!4588 thiss!1152) (currentBit!4583 thiss!1152)) lt!137553)))

(declare-fun b!90974 () Bool)

(declare-fun res!75066 () Bool)

(assert (=> b!90974 (=> (not res!75066) (not e!59848))))

(assert (=> b!90974 (= res!75066 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137553))))

(declare-fun b!90975 () Bool)

(declare-fun lt!137554 () (_ BitVec 64))

(assert (=> b!90975 (= e!59848 (bvsle lt!137553 (bvmul lt!137554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90975 (or (= lt!137554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137554)))))

(assert (=> b!90975 (= lt!137554 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))))))

(assert (= (and d!28316 res!75065) b!90974))

(assert (= (and b!90974 res!75066) b!90975))

(declare-fun m!135295 () Bool)

(assert (=> d!28316 m!135295))

(assert (=> d!28316 m!135179))

(assert (=> b!90852 d!28316))

(declare-fun d!28324 () Bool)

(declare-fun e!59849 () Bool)

(assert (=> d!28324 e!59849))

(declare-fun res!75067 () Bool)

(assert (=> d!28324 (=> (not res!75067) (not e!59849))))

(declare-fun lt!137562 () (_ BitVec 64))

(declare-fun lt!137559 () (_ BitVec 64))

(declare-fun lt!137557 () (_ BitVec 64))

(assert (=> d!28324 (= res!75067 (= lt!137559 (bvsub lt!137562 lt!137557)))))

(assert (=> d!28324 (or (= (bvand lt!137562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137562 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137562 lt!137557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28324 (= lt!137557 (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))) ((_ sign_extend 32) (currentByte!4588 thiss!1151)) ((_ sign_extend 32) (currentBit!4583 thiss!1151))))))

(declare-fun lt!137561 () (_ BitVec 64))

(declare-fun lt!137558 () (_ BitVec 64))

(assert (=> d!28324 (= lt!137562 (bvmul lt!137561 lt!137558))))

(assert (=> d!28324 (or (= lt!137561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137558 (bvsdiv (bvmul lt!137561 lt!137558) lt!137561)))))

(assert (=> d!28324 (= lt!137558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28324 (= lt!137561 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))))))

(assert (=> d!28324 (= lt!137559 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4588 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4583 thiss!1151))))))

(assert (=> d!28324 (invariant!0 (currentBit!4583 thiss!1151) (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151)))))

(assert (=> d!28324 (= (bitIndex!0 (size!1917 (buf!2307 thiss!1151)) (currentByte!4588 thiss!1151) (currentBit!4583 thiss!1151)) lt!137559)))

(declare-fun b!90976 () Bool)

(declare-fun res!75068 () Bool)

(assert (=> b!90976 (=> (not res!75068) (not e!59849))))

(assert (=> b!90976 (= res!75068 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137559))))

(declare-fun b!90977 () Bool)

(declare-fun lt!137560 () (_ BitVec 64))

(assert (=> b!90977 (= e!59849 (bvsle lt!137559 (bvmul lt!137560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90977 (or (= lt!137560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137560)))))

(assert (=> b!90977 (= lt!137560 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1151))))))

(assert (= (and d!28324 res!75067) b!90976))

(assert (= (and b!90976 res!75068) b!90977))

(assert (=> d!28324 m!135243))

(assert (=> d!28324 m!135181))

(assert (=> b!90852 d!28324))

(declare-fun d!28326 () Bool)

(assert (=> d!28326 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152))))))

(declare-fun bs!6994 () Bool)

(assert (= bs!6994 d!28326))

(assert (=> bs!6994 m!135179))

(assert (=> start!18318 d!28326))

(declare-fun d!28334 () Bool)

(assert (=> d!28334 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4583 thiss!1151) (currentByte!4588 thiss!1151) (size!1917 (buf!2307 thiss!1151))))))

(declare-fun bs!6995 () Bool)

(assert (= bs!6995 d!28334))

(assert (=> bs!6995 m!135181))

(assert (=> start!18318 d!28334))

(declare-fun d!28336 () Bool)

(assert (=> d!28336 (= (invariant!0 (currentBit!4583 thiss!1152) (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152))) (and (bvsge (currentBit!4583 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4583 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4588 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152))) (and (= (currentBit!4583 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4588 thiss!1152) (size!1917 (buf!2307 thiss!1152)))))))))

(assert (=> b!90856 d!28336))

(declare-fun d!28338 () Bool)

(assert (=> d!28338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))) ((_ sign_extend 32) (currentByte!4588 thiss!1152)) ((_ sign_extend 32) (currentBit!4583 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1917 (buf!2307 thiss!1152))) ((_ sign_extend 32) (currentByte!4588 thiss!1152)) ((_ sign_extend 32) (currentBit!4583 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6996 () Bool)

(assert (= bs!6996 d!28338))

(assert (=> bs!6996 m!135295))

(assert (=> b!90855 d!28338))

(check-sat (not b!90913) (not d!28338) (not d!28270) (not d!28316) (not d!28268) (not d!28286) (not b!90911) (not d!28282) (not d!28324) (not d!28278) (not b!90960) (not b!90922) (not b!90959) (not d!28312) (not d!28334) (not b!90958) (not b!90961) (not d!28326))
