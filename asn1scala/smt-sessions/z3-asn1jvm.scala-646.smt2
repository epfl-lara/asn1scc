; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18060 () Bool)

(assert start!18060)

(declare-fun b!88941 () Bool)

(declare-fun res!73225 () Bool)

(declare-fun e!58805 () Bool)

(assert (=> b!88941 (=> (not res!73225) (not e!58805))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88941 (= res!73225 (bvslt i!576 nBits!336))))

(declare-fun b!88942 () Bool)

(declare-fun res!73224 () Bool)

(assert (=> b!88942 (=> (not res!73224) (not e!58805))))

(declare-datatypes ((array!4199 0))(
  ( (array!4200 (arr!2533 (Array (_ BitVec 32) (_ BitVec 8))) (size!1896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3354 0))(
  ( (BitStream!3355 (buf!2286 array!4199) (currentByte!4528 (_ BitVec 32)) (currentBit!4523 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3354)

(declare-fun thiss!1151 () BitStream!3354)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88942 (= res!73224 (= (bitIndex!0 (size!1896 (buf!2286 thiss!1152)) (currentByte!4528 thiss!1152) (currentBit!4523 thiss!1152)) (bvadd (bitIndex!0 (size!1896 (buf!2286 thiss!1151)) (currentByte!4528 thiss!1151) (currentBit!4523 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88943 () Bool)

(declare-fun res!73221 () Bool)

(assert (=> b!88943 (=> (not res!73221) (not e!58805))))

(assert (=> b!88943 (= res!73221 (and (bvsle i!576 nBits!336) (= (size!1896 (buf!2286 thiss!1152)) (size!1896 (buf!2286 thiss!1151)))))))

(declare-fun b!88944 () Bool)

(declare-fun res!73222 () Bool)

(assert (=> b!88944 (=> (not res!73222) (not e!58805))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88944 (= res!73222 (invariant!0 (currentBit!4523 thiss!1152) (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152))))))

(declare-fun b!88945 () Bool)

(declare-fun res!73220 () Bool)

(assert (=> b!88945 (=> (not res!73220) (not e!58805))))

(assert (=> b!88945 (= res!73220 (invariant!0 (currentBit!4523 thiss!1151) (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151))))))

(declare-fun res!73226 () Bool)

(assert (=> start!18060 (=> (not res!73226) (not e!58805))))

(assert (=> start!18060 (= res!73226 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18060 e!58805))

(assert (=> start!18060 true))

(declare-fun e!58806 () Bool)

(declare-fun inv!12 (BitStream!3354) Bool)

(assert (=> start!18060 (and (inv!12 thiss!1151) e!58806)))

(declare-fun e!58802 () Bool)

(assert (=> start!18060 (and (inv!12 thiss!1152) e!58802)))

(declare-fun b!88946 () Bool)

(declare-fun array_inv!1742 (array!4199) Bool)

(assert (=> b!88946 (= e!58802 (array_inv!1742 (buf!2286 thiss!1152)))))

(declare-fun b!88947 () Bool)

(declare-fun res!73227 () Bool)

(assert (=> b!88947 (=> (not res!73227) (not e!58805))))

(assert (=> b!88947 (= res!73227 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88948 () Bool)

(declare-fun res!73228 () Bool)

(assert (=> b!88948 (=> (not res!73228) (not e!58805))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88948 (= res!73228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88949 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88949 (= e!58805 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152)))))))

(declare-fun b!88950 () Bool)

(declare-fun res!73223 () Bool)

(assert (=> b!88950 (=> (not res!73223) (not e!58805))))

(assert (=> b!88950 (= res!73223 (validate_offset_bits!1 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))) ((_ sign_extend 32) (currentByte!4528 thiss!1151)) ((_ sign_extend 32) (currentBit!4523 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88951 () Bool)

(assert (=> b!88951 (= e!58806 (array_inv!1742 (buf!2286 thiss!1151)))))

(assert (= (and start!18060 res!73226) b!88950))

(assert (= (and b!88950 res!73223) b!88945))

(assert (= (and b!88945 res!73220) b!88947))

(assert (= (and b!88947 res!73227) b!88944))

(assert (= (and b!88944 res!73222) b!88943))

(assert (= (and b!88943 res!73221) b!88942))

(assert (= (and b!88942 res!73224) b!88948))

(assert (= (and b!88948 res!73228) b!88941))

(assert (= (and b!88941 res!73225) b!88949))

(assert (= start!18060 b!88951))

(assert (= start!18060 b!88946))

(declare-fun m!133941 () Bool)

(assert (=> start!18060 m!133941))

(declare-fun m!133943 () Bool)

(assert (=> start!18060 m!133943))

(declare-fun m!133945 () Bool)

(assert (=> b!88948 m!133945))

(declare-fun m!133947 () Bool)

(assert (=> b!88944 m!133947))

(declare-fun m!133949 () Bool)

(assert (=> b!88949 m!133949))

(declare-fun m!133951 () Bool)

(assert (=> b!88942 m!133951))

(declare-fun m!133953 () Bool)

(assert (=> b!88942 m!133953))

(declare-fun m!133955 () Bool)

(assert (=> b!88946 m!133955))

(declare-fun m!133957 () Bool)

(assert (=> b!88945 m!133957))

(declare-fun m!133959 () Bool)

(assert (=> b!88951 m!133959))

(declare-fun m!133961 () Bool)

(assert (=> b!88950 m!133961))

(check-sat (not b!88944) (not b!88942) (not b!88946) (not b!88945) (not start!18060) (not b!88948) (not b!88951) (not b!88949) (not b!88950))
(check-sat)
(get-model)

(declare-fun d!27846 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6905 () Bool)

(assert (= bs!6905 d!27846))

(declare-fun m!133987 () Bool)

(assert (=> bs!6905 m!133987))

(assert (=> b!88948 d!27846))

(declare-fun d!27854 () Bool)

(declare-fun e!58832 () Bool)

(assert (=> d!27854 e!58832))

(declare-fun res!73277 () Bool)

(assert (=> d!27854 (=> (not res!73277) (not e!58832))))

(declare-fun lt!136349 () (_ BitVec 64))

(declare-fun lt!136348 () (_ BitVec 64))

(declare-fun lt!136345 () (_ BitVec 64))

(assert (=> d!27854 (= res!73277 (= lt!136348 (bvsub lt!136349 lt!136345)))))

(assert (=> d!27854 (or (= (bvand lt!136349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136349 lt!136345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27854 (= lt!136345 (remainingBits!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152))))))

(declare-fun lt!136346 () (_ BitVec 64))

(declare-fun lt!136347 () (_ BitVec 64))

(assert (=> d!27854 (= lt!136349 (bvmul lt!136346 lt!136347))))

(assert (=> d!27854 (or (= lt!136346 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136347 (bvsdiv (bvmul lt!136346 lt!136347) lt!136346)))))

(assert (=> d!27854 (= lt!136347 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27854 (= lt!136346 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))))))

(assert (=> d!27854 (= lt!136348 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4528 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4523 thiss!1152))))))

(assert (=> d!27854 (invariant!0 (currentBit!4523 thiss!1152) (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152)))))

(assert (=> d!27854 (= (bitIndex!0 (size!1896 (buf!2286 thiss!1152)) (currentByte!4528 thiss!1152) (currentBit!4523 thiss!1152)) lt!136348)))

(declare-fun b!89005 () Bool)

(declare-fun res!73276 () Bool)

(assert (=> b!89005 (=> (not res!73276) (not e!58832))))

(assert (=> b!89005 (= res!73276 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136348))))

(declare-fun b!89006 () Bool)

(declare-fun lt!136350 () (_ BitVec 64))

(assert (=> b!89006 (= e!58832 (bvsle lt!136348 (bvmul lt!136350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89006 (or (= lt!136350 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136350 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136350)))))

(assert (=> b!89006 (= lt!136350 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))))))

(assert (= (and d!27854 res!73277) b!89005))

(assert (= (and b!89005 res!73276) b!89006))

(assert (=> d!27854 m!133987))

(assert (=> d!27854 m!133947))

(assert (=> b!88942 d!27854))

(declare-fun d!27884 () Bool)

(declare-fun e!58833 () Bool)

(assert (=> d!27884 e!58833))

(declare-fun res!73279 () Bool)

(assert (=> d!27884 (=> (not res!73279) (not e!58833))))

(declare-fun lt!136351 () (_ BitVec 64))

(declare-fun lt!136355 () (_ BitVec 64))

(declare-fun lt!136354 () (_ BitVec 64))

(assert (=> d!27884 (= res!73279 (= lt!136354 (bvsub lt!136355 lt!136351)))))

(assert (=> d!27884 (or (= (bvand lt!136355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136355 lt!136351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27884 (= lt!136351 (remainingBits!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))) ((_ sign_extend 32) (currentByte!4528 thiss!1151)) ((_ sign_extend 32) (currentBit!4523 thiss!1151))))))

(declare-fun lt!136352 () (_ BitVec 64))

(declare-fun lt!136353 () (_ BitVec 64))

(assert (=> d!27884 (= lt!136355 (bvmul lt!136352 lt!136353))))

(assert (=> d!27884 (or (= lt!136352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136353 (bvsdiv (bvmul lt!136352 lt!136353) lt!136352)))))

(assert (=> d!27884 (= lt!136353 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27884 (= lt!136352 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))))))

(assert (=> d!27884 (= lt!136354 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4528 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4523 thiss!1151))))))

(assert (=> d!27884 (invariant!0 (currentBit!4523 thiss!1151) (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151)))))

(assert (=> d!27884 (= (bitIndex!0 (size!1896 (buf!2286 thiss!1151)) (currentByte!4528 thiss!1151) (currentBit!4523 thiss!1151)) lt!136354)))

(declare-fun b!89007 () Bool)

(declare-fun res!73278 () Bool)

(assert (=> b!89007 (=> (not res!73278) (not e!58833))))

(assert (=> b!89007 (= res!73278 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136354))))

(declare-fun b!89008 () Bool)

(declare-fun lt!136356 () (_ BitVec 64))

(assert (=> b!89008 (= e!58833 (bvsle lt!136354 (bvmul lt!136356 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89008 (or (= lt!136356 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136356 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136356)))))

(assert (=> b!89008 (= lt!136356 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))))))

(assert (= (and d!27884 res!73279) b!89007))

(assert (= (and b!89007 res!73278) b!89008))

(declare-fun m!133995 () Bool)

(assert (=> d!27884 m!133995))

(assert (=> d!27884 m!133957))

(assert (=> b!88942 d!27884))

(declare-fun d!27886 () Bool)

(assert (=> d!27886 (= (array_inv!1742 (buf!2286 thiss!1152)) (bvsge (size!1896 (buf!2286 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88946 d!27886))

(declare-fun d!27888 () Bool)

(assert (=> d!27888 (= (array_inv!1742 (buf!2286 thiss!1151)) (bvsge (size!1896 (buf!2286 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88951 d!27888))

(declare-fun d!27890 () Bool)

(assert (=> d!27890 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4523 thiss!1151) (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151))))))

(declare-fun bs!6913 () Bool)

(assert (= bs!6913 d!27890))

(assert (=> bs!6913 m!133957))

(assert (=> start!18060 d!27890))

(declare-fun d!27892 () Bool)

(assert (=> d!27892 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4523 thiss!1152) (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152))))))

(declare-fun bs!6914 () Bool)

(assert (= bs!6914 d!27892))

(assert (=> bs!6914 m!133947))

(assert (=> start!18060 d!27892))

(declare-fun d!27894 () Bool)

(assert (=> d!27894 (= (invariant!0 (currentBit!4523 thiss!1151) (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151))) (and (bvsge (currentBit!4523 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4523 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4528 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151))) (and (= (currentBit!4523 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4528 thiss!1151) (size!1896 (buf!2286 thiss!1151)))))))))

(assert (=> b!88945 d!27894))

(declare-fun d!27896 () Bool)

(assert (=> d!27896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))) ((_ sign_extend 32) (currentByte!4528 thiss!1151)) ((_ sign_extend 32) (currentBit!4523 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1151))) ((_ sign_extend 32) (currentByte!4528 thiss!1151)) ((_ sign_extend 32) (currentBit!4523 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6915 () Bool)

(assert (= bs!6915 d!27896))

(assert (=> bs!6915 m!133995))

(assert (=> b!88950 d!27896))

(declare-fun d!27898 () Bool)

(assert (=> d!27898 (= (invariant!0 (currentBit!4523 thiss!1152) (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152))) (and (bvsge (currentBit!4523 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4523 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4528 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152))) (and (= (currentBit!4523 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4528 thiss!1152) (size!1896 (buf!2286 thiss!1152)))))))))

(assert (=> b!88944 d!27898))

(declare-fun d!27900 () Bool)

(assert (=> d!27900 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1896 (buf!2286 thiss!1152))) ((_ sign_extend 32) (currentByte!4528 thiss!1152)) ((_ sign_extend 32) (currentBit!4523 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6916 () Bool)

(assert (= bs!6916 d!27900))

(assert (=> bs!6916 m!133987))

(assert (=> b!88949 d!27900))

(check-sat (not d!27884) (not d!27896) (not d!27846) (not d!27890) (not d!27854) (not d!27900) (not d!27892))
(check-sat)
