; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60412 () Bool)

(assert start!60412)

(declare-fun res!228031 () Bool)

(declare-fun e!193981 () Bool)

(assert (=> start!60412 (=> (not res!228031) (not e!193981))))

(declare-datatypes ((array!15467 0))(
  ( (array!15468 (arr!7700 (Array (_ BitVec 32) (_ BitVec 8))) (size!6713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12240 0))(
  ( (BitStream!12241 (buf!7181 array!15467) (currentByte!13252 (_ BitVec 32)) (currentBit!13247 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12240)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12240 (_ BitVec 64)) Bool)

(assert (=> start!60412 (= res!228031 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60412 e!193981))

(declare-fun e!193980 () Bool)

(declare-fun inv!12 (BitStream!12240) Bool)

(assert (=> start!60412 (and (inv!12 thiss!882) e!193980)))

(assert (=> start!60412 true))

(declare-fun b!274060 () Bool)

(declare-fun res!228030 () Bool)

(assert (=> b!274060 (=> (not res!228030) (not e!193981))))

(assert (=> b!274060 (= res!228030 (bvslt (bvadd (currentBit!13247 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274061 () Bool)

(assert (=> b!274061 (= e!193981 (not (inv!12 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882)))))))

(declare-fun b!274062 () Bool)

(declare-fun array_inv!6437 (array!15467) Bool)

(assert (=> b!274062 (= e!193980 (array_inv!6437 (buf!7181 thiss!882)))))

(assert (= (and start!60412 res!228031) b!274060))

(assert (= (and b!274060 res!228030) b!274061))

(assert (= start!60412 b!274062))

(declare-fun m!406819 () Bool)

(assert (=> start!60412 m!406819))

(declare-fun m!406821 () Bool)

(assert (=> start!60412 m!406821))

(declare-fun m!406823 () Bool)

(assert (=> b!274061 m!406823))

(declare-fun m!406825 () Bool)

(assert (=> b!274062 m!406825))

(check-sat (not b!274062) (not b!274061) (not start!60412))
(check-sat)
(get-model)

(declare-fun d!93950 () Bool)

(assert (=> d!93950 (= (array_inv!6437 (buf!7181 thiss!882)) (bvsge (size!6713 (buf!7181 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274062 d!93950))

(declare-fun d!93952 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93952 (= (inv!12 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (invariant!0 (currentBit!13247 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (currentByte!13252 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (size!6713 (buf!7181 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))))))))

(declare-fun bs!23675 () Bool)

(assert (= bs!23675 d!93952))

(declare-fun m!406835 () Bool)

(assert (=> bs!23675 m!406835))

(assert (=> b!274061 d!93952))

(declare-fun d!93954 () Bool)

(declare-fun res!228043 () Bool)

(declare-fun e!193996 () Bool)

(assert (=> d!93954 (=> (not res!228043) (not e!193996))))

(assert (=> d!93954 (= res!228043 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882)))))))))

(assert (=> d!93954 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193996)))

(declare-fun b!274079 () Bool)

(declare-fun lt!412085 () (_ BitVec 64))

(assert (=> b!274079 (= e!193996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412085) (bvsle lt!412085 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274079 (= lt!412085 (bvadd (bitIndex!0 (size!6713 (buf!7181 thiss!882)) (currentByte!13252 thiss!882) (currentBit!13247 thiss!882)) diffInBits!15))))

(assert (= (and d!93954 res!228043) b!274079))

(declare-fun m!406845 () Bool)

(assert (=> b!274079 m!406845))

(assert (=> start!60412 d!93954))

(declare-fun d!93968 () Bool)

(assert (=> d!93968 (= (inv!12 thiss!882) (invariant!0 (currentBit!13247 thiss!882) (currentByte!13252 thiss!882) (size!6713 (buf!7181 thiss!882))))))

(declare-fun bs!23679 () Bool)

(assert (= bs!23679 d!93968))

(declare-fun m!406847 () Bool)

(assert (=> bs!23679 m!406847))

(assert (=> start!60412 d!93968))

(check-sat (not d!93952) (not b!274079) (not d!93968))
(check-sat)
(get-model)

(declare-fun d!93980 () Bool)

(assert (=> d!93980 (= (invariant!0 (currentBit!13247 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (currentByte!13252 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (size!6713 (buf!7181 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))))) (and (bvsge (currentBit!13247 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13247 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13252 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13252 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (size!6713 (buf!7181 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))))) (and (= (currentBit!13247 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13252 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882))) (size!6713 (buf!7181 (BitStream!12241 (buf!7181 thiss!882) (bvsub (bvadd (currentByte!13252 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13247 thiss!882)))))))))))

(assert (=> d!93952 d!93980))

(declare-fun d!93982 () Bool)

(declare-fun e!194005 () Bool)

(assert (=> d!93982 e!194005))

(declare-fun res!228058 () Bool)

(assert (=> d!93982 (=> (not res!228058) (not e!194005))))

(declare-fun lt!412124 () (_ BitVec 64))

(declare-fun lt!412123 () (_ BitVec 64))

(declare-fun lt!412122 () (_ BitVec 64))

(assert (=> d!93982 (= res!228058 (= lt!412124 (bvsub lt!412123 lt!412122)))))

(assert (=> d!93982 (or (= (bvand lt!412123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412123 lt!412122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93982 (= lt!412122 (remainingBits!0 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882))) ((_ sign_extend 32) (currentByte!13252 thiss!882)) ((_ sign_extend 32) (currentBit!13247 thiss!882))))))

(declare-fun lt!412121 () (_ BitVec 64))

(declare-fun lt!412119 () (_ BitVec 64))

(assert (=> d!93982 (= lt!412123 (bvmul lt!412121 lt!412119))))

(assert (=> d!93982 (or (= lt!412121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412119 (bvsdiv (bvmul lt!412121 lt!412119) lt!412121)))))

(assert (=> d!93982 (= lt!412119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93982 (= lt!412121 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882))))))

(assert (=> d!93982 (= lt!412124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13252 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13247 thiss!882))))))

(assert (=> d!93982 (invariant!0 (currentBit!13247 thiss!882) (currentByte!13252 thiss!882) (size!6713 (buf!7181 thiss!882)))))

(assert (=> d!93982 (= (bitIndex!0 (size!6713 (buf!7181 thiss!882)) (currentByte!13252 thiss!882) (currentBit!13247 thiss!882)) lt!412124)))

(declare-fun b!274094 () Bool)

(declare-fun res!228057 () Bool)

(assert (=> b!274094 (=> (not res!228057) (not e!194005))))

(assert (=> b!274094 (= res!228057 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412124))))

(declare-fun b!274095 () Bool)

(declare-fun lt!412120 () (_ BitVec 64))

(assert (=> b!274095 (= e!194005 (bvsle lt!412124 (bvmul lt!412120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274095 (or (= lt!412120 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412120 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412120)))))

(assert (=> b!274095 (= lt!412120 ((_ sign_extend 32) (size!6713 (buf!7181 thiss!882))))))

(assert (= (and d!93982 res!228058) b!274094))

(assert (= (and b!274094 res!228057) b!274095))

(declare-fun m!406855 () Bool)

(assert (=> d!93982 m!406855))

(assert (=> d!93982 m!406847))

(assert (=> b!274079 d!93982))

(declare-fun d!93986 () Bool)

(assert (=> d!93986 (= (invariant!0 (currentBit!13247 thiss!882) (currentByte!13252 thiss!882) (size!6713 (buf!7181 thiss!882))) (and (bvsge (currentBit!13247 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13247 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13252 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13252 thiss!882) (size!6713 (buf!7181 thiss!882))) (and (= (currentBit!13247 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13252 thiss!882) (size!6713 (buf!7181 thiss!882)))))))))

(assert (=> d!93968 d!93986))

(check-sat (not d!93982))
(check-sat)
