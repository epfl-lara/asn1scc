; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60374 () Bool)

(assert start!60374)

(declare-fun res!227986 () Bool)

(declare-fun e!193926 () Bool)

(assert (=> start!60374 (=> (not res!227986) (not e!193926))))

(declare-datatypes ((array!15456 0))(
  ( (array!15457 (arr!7696 (Array (_ BitVec 32) (_ BitVec 8))) (size!6709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12232 0))(
  ( (BitStream!12233 (buf!7177 array!15456) (currentByte!13242 (_ BitVec 32)) (currentBit!13237 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12232)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12232 (_ BitVec 64)) Bool)

(assert (=> start!60374 (= res!227986 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60374 e!193926))

(declare-fun e!193927 () Bool)

(declare-fun inv!12 (BitStream!12232) Bool)

(assert (=> start!60374 (and (inv!12 thiss!882) e!193927)))

(assert (=> start!60374 true))

(declare-fun b!274001 () Bool)

(declare-fun lt!412010 () (_ BitVec 32))

(assert (=> b!274001 (= e!193926 (and (= (bvand (currentBit!13237 thiss!882) #b10000000000000000000000000000000) (bvand lt!412010 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13237 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!13237 thiss!882) lt!412010) #b10000000000000000000000000000000)))))))

(assert (=> b!274001 (= lt!412010 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274002 () Bool)

(declare-fun array_inv!6433 (array!15456) Bool)

(assert (=> b!274002 (= e!193927 (array_inv!6433 (buf!7177 thiss!882)))))

(assert (= (and start!60374 res!227986) b!274001))

(assert (= start!60374 b!274002))

(declare-fun m!406775 () Bool)

(assert (=> start!60374 m!406775))

(declare-fun m!406777 () Bool)

(assert (=> start!60374 m!406777))

(declare-fun m!406779 () Bool)

(assert (=> b!274002 m!406779))

(push 1)

(assert (not start!60374))

(assert (not b!274002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93920 () Bool)

(declare-fun res!227998 () Bool)

(declare-fun e!193951 () Bool)

(assert (=> d!93920 (=> (not res!227998) (not e!193951))))

(assert (=> d!93920 (= res!227998 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882)))))))))

(assert (=> d!93920 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193951)))

(declare-fun b!274022 () Bool)

(declare-fun lt!412022 () (_ BitVec 64))

(assert (=> b!274022 (= e!193951 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412022) (bvsle lt!412022 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274022 (= lt!412022 (bvadd (bitIndex!0 (size!6709 (buf!7177 thiss!882)) (currentByte!13242 thiss!882) (currentBit!13237 thiss!882)) diffInBits!15))))

(assert (= (and d!93920 res!227998) b!274022))

(declare-fun m!406797 () Bool)

(assert (=> b!274022 m!406797))

(assert (=> start!60374 d!93920))

(declare-fun d!93928 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93928 (= (inv!12 thiss!882) (invariant!0 (currentBit!13237 thiss!882) (currentByte!13242 thiss!882) (size!6709 (buf!7177 thiss!882))))))

(declare-fun bs!23670 () Bool)

(assert (= bs!23670 d!93928))

(declare-fun m!406799 () Bool)

(assert (=> bs!23670 m!406799))

(assert (=> start!60374 d!93928))

(declare-fun d!93930 () Bool)

(assert (=> d!93930 (= (array_inv!6433 (buf!7177 thiss!882)) (bvsge (size!6709 (buf!7177 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274002 d!93930))

(push 1)

(assert (not b!274022))

(assert (not d!93928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93938 () Bool)

(declare-fun e!193960 () Bool)

(assert (=> d!93938 e!193960))

(declare-fun res!228013 () Bool)

(assert (=> d!93938 (=> (not res!228013) (not e!193960))))

(declare-fun lt!412059 () (_ BitVec 64))

(declare-fun lt!412058 () (_ BitVec 64))

(declare-fun lt!412057 () (_ BitVec 64))

(assert (=> d!93938 (= res!228013 (= lt!412059 (bvsub lt!412058 lt!412057)))))

(assert (=> d!93938 (or (= (bvand lt!412058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412058 lt!412057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93938 (= lt!412057 (remainingBits!0 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882))) ((_ sign_extend 32) (currentByte!13242 thiss!882)) ((_ sign_extend 32) (currentBit!13237 thiss!882))))))

(declare-fun lt!412061 () (_ BitVec 64))

(declare-fun lt!412056 () (_ BitVec 64))

(assert (=> d!93938 (= lt!412058 (bvmul lt!412061 lt!412056))))

(assert (=> d!93938 (or (= lt!412061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412056 (bvsdiv (bvmul lt!412061 lt!412056) lt!412061)))))

(assert (=> d!93938 (= lt!412056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93938 (= lt!412061 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882))))))

(assert (=> d!93938 (= lt!412059 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13242 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13237 thiss!882))))))

(assert (=> d!93938 (invariant!0 (currentBit!13237 thiss!882) (currentByte!13242 thiss!882) (size!6709 (buf!7177 thiss!882)))))

(assert (=> d!93938 (= (bitIndex!0 (size!6709 (buf!7177 thiss!882)) (currentByte!13242 thiss!882) (currentBit!13237 thiss!882)) lt!412059)))

(declare-fun b!274037 () Bool)

(declare-fun res!228012 () Bool)

(assert (=> b!274037 (=> (not res!228012) (not e!193960))))

(assert (=> b!274037 (= res!228012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412059))))

(declare-fun b!274038 () Bool)

(declare-fun lt!412060 () (_ BitVec 64))

(assert (=> b!274038 (= e!193960 (bvsle lt!412059 (bvmul lt!412060 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274038 (or (= lt!412060 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412060 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412060)))))

(assert (=> b!274038 (= lt!412060 ((_ sign_extend 32) (size!6709 (buf!7177 thiss!882))))))

(assert (= (and d!93938 res!228013) b!274037))

(assert (= (and b!274037 res!228012) b!274038))

(declare-fun m!406807 () Bool)

(assert (=> d!93938 m!406807))

(assert (=> d!93938 m!406799))

(assert (=> b!274022 d!93938))

(declare-fun d!93942 () Bool)

(assert (=> d!93942 (= (invariant!0 (currentBit!13237 thiss!882) (currentByte!13242 thiss!882) (size!6709 (buf!7177 thiss!882))) (and (bvsge (currentBit!13237 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13237 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13242 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13242 thiss!882) (size!6709 (buf!7177 thiss!882))) (and (= (currentBit!13237 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13242 thiss!882) (size!6709 (buf!7177 thiss!882)))))))))

(assert (=> d!93928 d!93942))

(push 1)

(assert (not d!93938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

