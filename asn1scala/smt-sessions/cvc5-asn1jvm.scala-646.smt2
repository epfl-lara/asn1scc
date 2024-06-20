; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18058 () Bool)

(assert start!18058)

(declare-fun b!88908 () Bool)

(declare-fun res!73201 () Bool)

(declare-fun e!58790 () Bool)

(assert (=> b!88908 (=> (not res!73201) (not e!58790))))

(declare-datatypes ((array!4197 0))(
  ( (array!4198 (arr!2532 (Array (_ BitVec 32) (_ BitVec 8))) (size!1895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3352 0))(
  ( (BitStream!3353 (buf!2285 array!4197) (currentByte!4527 (_ BitVec 32)) (currentBit!4522 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3352)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88908 (= res!73201 (validate_offset_bits!1 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))) ((_ sign_extend 32) (currentByte!4527 thiss!1151)) ((_ sign_extend 32) (currentBit!4522 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88909 () Bool)

(declare-fun thiss!1152 () BitStream!3352)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88909 (= e!58790 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152)))))))

(declare-fun b!88910 () Bool)

(declare-fun res!73198 () Bool)

(assert (=> b!88910 (=> (not res!73198) (not e!58790))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88910 (= res!73198 (and (bvsle i!576 nBits!336) (= (size!1895 (buf!2285 thiss!1152)) (size!1895 (buf!2285 thiss!1151)))))))

(declare-fun b!88911 () Bool)

(declare-fun res!73199 () Bool)

(assert (=> b!88911 (=> (not res!73199) (not e!58790))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88911 (= res!73199 (invariant!0 (currentBit!4522 thiss!1151) (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151))))))

(declare-fun b!88912 () Bool)

(declare-fun res!73194 () Bool)

(assert (=> b!88912 (=> (not res!73194) (not e!58790))))

(assert (=> b!88912 (= res!73194 (bvslt i!576 nBits!336))))

(declare-fun b!88913 () Bool)

(declare-fun res!73193 () Bool)

(assert (=> b!88913 (=> (not res!73193) (not e!58790))))

(assert (=> b!88913 (= res!73193 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88914 () Bool)

(declare-fun res!73196 () Bool)

(assert (=> b!88914 (=> (not res!73196) (not e!58790))))

(assert (=> b!88914 (= res!73196 (validate_offset_bits!1 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88916 () Bool)

(declare-fun res!73195 () Bool)

(assert (=> b!88916 (=> (not res!73195) (not e!58790))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88916 (= res!73195 (= (bitIndex!0 (size!1895 (buf!2285 thiss!1152)) (currentByte!4527 thiss!1152) (currentBit!4522 thiss!1152)) (bvadd (bitIndex!0 (size!1895 (buf!2285 thiss!1151)) (currentByte!4527 thiss!1151) (currentBit!4522 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88917 () Bool)

(declare-fun e!58788 () Bool)

(declare-fun array_inv!1741 (array!4197) Bool)

(assert (=> b!88917 (= e!58788 (array_inv!1741 (buf!2285 thiss!1152)))))

(declare-fun b!88918 () Bool)

(declare-fun res!73197 () Bool)

(assert (=> b!88918 (=> (not res!73197) (not e!58790))))

(assert (=> b!88918 (= res!73197 (invariant!0 (currentBit!4522 thiss!1152) (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152))))))

(declare-fun b!88915 () Bool)

(declare-fun e!58789 () Bool)

(assert (=> b!88915 (= e!58789 (array_inv!1741 (buf!2285 thiss!1151)))))

(declare-fun res!73200 () Bool)

(assert (=> start!18058 (=> (not res!73200) (not e!58790))))

(assert (=> start!18058 (= res!73200 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18058 e!58790))

(assert (=> start!18058 true))

(declare-fun inv!12 (BitStream!3352) Bool)

(assert (=> start!18058 (and (inv!12 thiss!1151) e!58789)))

(assert (=> start!18058 (and (inv!12 thiss!1152) e!58788)))

(assert (= (and start!18058 res!73200) b!88908))

(assert (= (and b!88908 res!73201) b!88911))

(assert (= (and b!88911 res!73199) b!88913))

(assert (= (and b!88913 res!73193) b!88918))

(assert (= (and b!88918 res!73197) b!88910))

(assert (= (and b!88910 res!73198) b!88916))

(assert (= (and b!88916 res!73195) b!88914))

(assert (= (and b!88914 res!73196) b!88912))

(assert (= (and b!88912 res!73194) b!88909))

(assert (= start!18058 b!88915))

(assert (= start!18058 b!88917))

(declare-fun m!133919 () Bool)

(assert (=> b!88911 m!133919))

(declare-fun m!133921 () Bool)

(assert (=> b!88916 m!133921))

(declare-fun m!133923 () Bool)

(assert (=> b!88916 m!133923))

(declare-fun m!133925 () Bool)

(assert (=> b!88914 m!133925))

(declare-fun m!133927 () Bool)

(assert (=> b!88909 m!133927))

(declare-fun m!133929 () Bool)

(assert (=> b!88908 m!133929))

(declare-fun m!133931 () Bool)

(assert (=> b!88915 m!133931))

(declare-fun m!133933 () Bool)

(assert (=> b!88917 m!133933))

(declare-fun m!133935 () Bool)

(assert (=> start!18058 m!133935))

(declare-fun m!133937 () Bool)

(assert (=> start!18058 m!133937))

(declare-fun m!133939 () Bool)

(assert (=> b!88918 m!133939))

(push 1)

(assert (not b!88914))

(assert (not b!88917))

(assert (not b!88916))

(assert (not b!88915))

(assert (not b!88909))

(assert (not start!18058))

(assert (not b!88908))

(assert (not b!88911))

(assert (not b!88918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27836 () Bool)

(assert (=> d!27836 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4522 thiss!1151) (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151))))))

(declare-fun bs!6902 () Bool)

(assert (= bs!6902 d!27836))

(assert (=> bs!6902 m!133919))

(assert (=> start!18058 d!27836))

(declare-fun d!27840 () Bool)

(assert (=> d!27840 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4522 thiss!1152) (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152))))))

(declare-fun bs!6903 () Bool)

(assert (= bs!6903 d!27840))

(assert (=> bs!6903 m!133939))

(assert (=> start!18058 d!27840))

(declare-fun d!27842 () Bool)

(assert (=> d!27842 (= (array_inv!1741 (buf!2285 thiss!1152)) (bvsge (size!1895 (buf!2285 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88917 d!27842))

(declare-fun d!27844 () Bool)

(assert (=> d!27844 (= (invariant!0 (currentBit!4522 thiss!1151) (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151))) (and (bvsge (currentBit!4522 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4522 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4527 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151))) (and (= (currentBit!4522 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151)))))))))

(assert (=> b!88911 d!27844))

(declare-fun d!27852 () Bool)

(declare-fun e!58824 () Bool)

(assert (=> d!27852 e!58824))

(declare-fun res!73261 () Bool)

(assert (=> d!27852 (=> (not res!73261) (not e!58824))))

(declare-fun lt!136298 () (_ BitVec 64))

(declare-fun lt!136302 () (_ BitVec 64))

(declare-fun lt!136299 () (_ BitVec 64))

(assert (=> d!27852 (= res!73261 (= lt!136299 (bvsub lt!136302 lt!136298)))))

(assert (=> d!27852 (or (= (bvand lt!136302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136302 lt!136298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27852 (= lt!136298 (remainingBits!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152))))))

(declare-fun lt!136301 () (_ BitVec 64))

(declare-fun lt!136300 () (_ BitVec 64))

(assert (=> d!27852 (= lt!136302 (bvmul lt!136301 lt!136300))))

(assert (=> d!27852 (or (= lt!136301 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136300 (bvsdiv (bvmul lt!136301 lt!136300) lt!136301)))))

(assert (=> d!27852 (= lt!136300 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27852 (= lt!136301 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))))))

(assert (=> d!27852 (= lt!136299 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4527 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4522 thiss!1152))))))

(assert (=> d!27852 (invariant!0 (currentBit!4522 thiss!1152) (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152)))))

(assert (=> d!27852 (= (bitIndex!0 (size!1895 (buf!2285 thiss!1152)) (currentByte!4527 thiss!1152) (currentBit!4522 thiss!1152)) lt!136299)))

(declare-fun b!88989 () Bool)

(declare-fun res!73260 () Bool)

(assert (=> b!88989 (=> (not res!73260) (not e!58824))))

(assert (=> b!88989 (= res!73260 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136299))))

(declare-fun b!88990 () Bool)

(declare-fun lt!136297 () (_ BitVec 64))

(assert (=> b!88990 (= e!58824 (bvsle lt!136299 (bvmul lt!136297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88990 (or (= lt!136297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136297)))))

(assert (=> b!88990 (= lt!136297 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))))))

(assert (= (and d!27852 res!73261) b!88989))

(assert (= (and b!88989 res!73260) b!88990))

(declare-fun m!133989 () Bool)

(assert (=> d!27852 m!133989))

(assert (=> d!27852 m!133939))

(assert (=> b!88916 d!27852))

(declare-fun d!27866 () Bool)

(declare-fun e!58827 () Bool)

(assert (=> d!27866 e!58827))

(declare-fun res!73265 () Bool)

(assert (=> d!27866 (=> (not res!73265) (not e!58827))))

(declare-fun lt!136314 () (_ BitVec 64))

(declare-fun lt!136310 () (_ BitVec 64))

(declare-fun lt!136311 () (_ BitVec 64))

(assert (=> d!27866 (= res!73265 (= lt!136311 (bvsub lt!136314 lt!136310)))))

(assert (=> d!27866 (or (= (bvand lt!136314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136310 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136314 lt!136310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27866 (= lt!136310 (remainingBits!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))) ((_ sign_extend 32) (currentByte!4527 thiss!1151)) ((_ sign_extend 32) (currentBit!4522 thiss!1151))))))

(declare-fun lt!136313 () (_ BitVec 64))

(declare-fun lt!136312 () (_ BitVec 64))

(assert (=> d!27866 (= lt!136314 (bvmul lt!136313 lt!136312))))

(assert (=> d!27866 (or (= lt!136313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136312 (bvsdiv (bvmul lt!136313 lt!136312) lt!136313)))))

(assert (=> d!27866 (= lt!136312 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27866 (= lt!136313 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))))))

(assert (=> d!27866 (= lt!136311 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4527 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4522 thiss!1151))))))

(assert (=> d!27866 (invariant!0 (currentBit!4522 thiss!1151) (currentByte!4527 thiss!1151) (size!1895 (buf!2285 thiss!1151)))))

(assert (=> d!27866 (= (bitIndex!0 (size!1895 (buf!2285 thiss!1151)) (currentByte!4527 thiss!1151) (currentBit!4522 thiss!1151)) lt!136311)))

(declare-fun b!88991 () Bool)

(declare-fun res!73264 () Bool)

(assert (=> b!88991 (=> (not res!73264) (not e!58827))))

(assert (=> b!88991 (= res!73264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136311))))

(declare-fun b!88992 () Bool)

(declare-fun lt!136309 () (_ BitVec 64))

(assert (=> b!88992 (= e!58827 (bvsle lt!136311 (bvmul lt!136309 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88992 (or (= lt!136309 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136309 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136309)))))

(assert (=> b!88992 (= lt!136309 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))))))

(assert (= (and d!27866 res!73265) b!88991))

(assert (= (and b!88991 res!73264) b!88992))

(declare-fun m!133991 () Bool)

(assert (=> d!27866 m!133991))

(assert (=> d!27866 m!133919))

(assert (=> b!88916 d!27866))

(declare-fun d!27868 () Bool)

(assert (=> d!27868 (= (array_inv!1741 (buf!2285 thiss!1151)) (bvsge (size!1895 (buf!2285 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88915 d!27868))

(declare-fun d!27870 () Bool)

(assert (=> d!27870 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6909 () Bool)

(assert (= bs!6909 d!27870))

(assert (=> bs!6909 m!133989))

(assert (=> b!88909 d!27870))

(declare-fun d!27872 () Bool)

(assert (=> d!27872 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1152))) ((_ sign_extend 32) (currentByte!4527 thiss!1152)) ((_ sign_extend 32) (currentBit!4522 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6910 () Bool)

(assert (= bs!6910 d!27872))

(assert (=> bs!6910 m!133989))

(assert (=> b!88914 d!27872))

(declare-fun d!27874 () Bool)

(assert (=> d!27874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))) ((_ sign_extend 32) (currentByte!4527 thiss!1151)) ((_ sign_extend 32) (currentBit!4522 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1895 (buf!2285 thiss!1151))) ((_ sign_extend 32) (currentByte!4527 thiss!1151)) ((_ sign_extend 32) (currentBit!4522 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6911 () Bool)

(assert (= bs!6911 d!27874))

(assert (=> bs!6911 m!133991))

(assert (=> b!88908 d!27874))

(declare-fun d!27878 () Bool)

(assert (=> d!27878 (= (invariant!0 (currentBit!4522 thiss!1152) (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152))) (and (bvsge (currentBit!4522 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4522 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4527 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152))) (and (= (currentBit!4522 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4527 thiss!1152) (size!1895 (buf!2285 thiss!1152)))))))))

(assert (=> b!88918 d!27878))

(push 1)

(assert (not d!27874))

(assert (not d!27840))

(assert (not d!27866))

(assert (not d!27852))

(assert (not d!27836))

(assert (not d!27870))

(assert (not d!27872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

