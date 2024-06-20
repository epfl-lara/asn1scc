; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60660 () Bool)

(assert start!60660)

(declare-fun res!228328 () Bool)

(declare-fun e!194337 () Bool)

(assert (=> start!60660 (=> (not res!228328) (not e!194337))))

(declare-datatypes ((array!15534 0))(
  ( (array!15535 (arr!7723 (Array (_ BitVec 32) (_ BitVec 8))) (size!6736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12286 0))(
  ( (BitStream!12287 (buf!7204 array!15534) (currentByte!13313 (_ BitVec 32)) (currentBit!13308 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12286)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12286 (_ BitVec 64)) Bool)

(assert (=> start!60660 (= res!228328 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60660 e!194337))

(declare-fun e!194335 () Bool)

(declare-fun inv!12 (BitStream!12286) Bool)

(assert (=> start!60660 (and (inv!12 thiss!882) e!194335)))

(assert (=> start!60660 true))

(declare-fun b!274447 () Bool)

(declare-fun e!194338 () Bool)

(assert (=> b!274447 (= e!194337 e!194338)))

(declare-fun res!228327 () Bool)

(assert (=> b!274447 (=> (not res!228327) (not e!194338))))

(declare-fun lt!412622 () (_ BitVec 32))

(assert (=> b!274447 (= res!228327 (and (bvsge lt!412622 #b00000000000000000000000000000000) (bvsge lt!412622 #b00000000000000000000000000001000)))))

(assert (=> b!274447 (= lt!412622 (bvadd (currentBit!13308 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274448 () Bool)

(assert (=> b!274448 (= e!194338 (not (inv!12 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000)))))))

(declare-fun b!274449 () Bool)

(declare-fun array_inv!6460 (array!15534) Bool)

(assert (=> b!274449 (= e!194335 (array_inv!6460 (buf!7204 thiss!882)))))

(assert (= (and start!60660 res!228328) b!274447))

(assert (= (and b!274447 res!228327) b!274448))

(assert (= start!60660 b!274449))

(declare-fun m!407123 () Bool)

(assert (=> start!60660 m!407123))

(declare-fun m!407125 () Bool)

(assert (=> start!60660 m!407125))

(declare-fun m!407127 () Bool)

(assert (=> b!274448 m!407127))

(declare-fun m!407129 () Bool)

(assert (=> b!274449 m!407129))

(push 1)

(assert (not start!60660))

(assert (not b!274448))

(assert (not b!274449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94210 () Bool)

(declare-fun res!228346 () Bool)

(declare-fun e!194368 () Bool)

(assert (=> d!94210 (=> (not res!228346) (not e!194368))))

(assert (=> d!94210 (= res!228346 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882)))))))))

(assert (=> d!94210 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194368)))

(declare-fun b!274475 () Bool)

(declare-fun lt!412634 () (_ BitVec 64))

(assert (=> b!274475 (= e!194368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412634) (bvsle lt!412634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274475 (= lt!412634 (bvadd (bitIndex!0 (size!6736 (buf!7204 thiss!882)) (currentByte!13313 thiss!882) (currentBit!13308 thiss!882)) diffInBits!15))))

(assert (= (and d!94210 res!228346) b!274475))

(declare-fun m!407153 () Bool)

(assert (=> b!274475 m!407153))

(assert (=> start!60660 d!94210))

(declare-fun d!94212 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94212 (= (inv!12 thiss!882) (invariant!0 (currentBit!13308 thiss!882) (currentByte!13313 thiss!882) (size!6736 (buf!7204 thiss!882))))))

(declare-fun bs!23728 () Bool)

(assert (= bs!23728 d!94212))

(declare-fun m!407155 () Bool)

(assert (=> bs!23728 m!407155))

(assert (=> start!60660 d!94212))

(declare-fun d!94214 () Bool)

(assert (=> d!94214 (= (inv!12 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13308 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (currentByte!13313 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (size!6736 (buf!7204 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))))))))

(declare-fun bs!23729 () Bool)

(assert (= bs!23729 d!94214))

(declare-fun m!407157 () Bool)

(assert (=> bs!23729 m!407157))

(assert (=> b!274448 d!94214))

(declare-fun d!94216 () Bool)

(assert (=> d!94216 (= (array_inv!6460 (buf!7204 thiss!882)) (bvsge (size!6736 (buf!7204 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274449 d!94216))

(push 1)

(assert (not d!94212))

(assert (not b!274475))

(assert (not d!94214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94228 () Bool)

(assert (=> d!94228 (= (invariant!0 (currentBit!13308 thiss!882) (currentByte!13313 thiss!882) (size!6736 (buf!7204 thiss!882))) (and (bvsge (currentBit!13308 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13308 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13313 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13313 thiss!882) (size!6736 (buf!7204 thiss!882))) (and (= (currentBit!13308 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13313 thiss!882) (size!6736 (buf!7204 thiss!882)))))))))

(assert (=> d!94212 d!94228))

(declare-fun d!94230 () Bool)

(declare-fun e!194377 () Bool)

(assert (=> d!94230 e!194377))

(declare-fun res!228360 () Bool)

(assert (=> d!94230 (=> (not res!228360) (not e!194377))))

(declare-fun lt!412672 () (_ BitVec 64))

(declare-fun lt!412668 () (_ BitVec 64))

(declare-fun lt!412673 () (_ BitVec 64))

(assert (=> d!94230 (= res!228360 (= lt!412668 (bvsub lt!412673 lt!412672)))))

(assert (=> d!94230 (or (= (bvand lt!412673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412672 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412673 lt!412672) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94230 (= lt!412672 (remainingBits!0 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882))) ((_ sign_extend 32) (currentByte!13313 thiss!882)) ((_ sign_extend 32) (currentBit!13308 thiss!882))))))

(declare-fun lt!412669 () (_ BitVec 64))

(declare-fun lt!412670 () (_ BitVec 64))

(assert (=> d!94230 (= lt!412673 (bvmul lt!412669 lt!412670))))

(assert (=> d!94230 (or (= lt!412669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412670 (bvsdiv (bvmul lt!412669 lt!412670) lt!412669)))))

(assert (=> d!94230 (= lt!412670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94230 (= lt!412669 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882))))))

(assert (=> d!94230 (= lt!412668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13313 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13308 thiss!882))))))

(assert (=> d!94230 (invariant!0 (currentBit!13308 thiss!882) (currentByte!13313 thiss!882) (size!6736 (buf!7204 thiss!882)))))

(assert (=> d!94230 (= (bitIndex!0 (size!6736 (buf!7204 thiss!882)) (currentByte!13313 thiss!882) (currentBit!13308 thiss!882)) lt!412668)))

(declare-fun b!274490 () Bool)

(declare-fun res!228361 () Bool)

(assert (=> b!274490 (=> (not res!228361) (not e!194377))))

(assert (=> b!274490 (= res!228361 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412668))))

(declare-fun b!274491 () Bool)

(declare-fun lt!412671 () (_ BitVec 64))

(assert (=> b!274491 (= e!194377 (bvsle lt!412668 (bvmul lt!412671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274491 (or (= lt!412671 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412671 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412671)))))

(assert (=> b!274491 (= lt!412671 ((_ sign_extend 32) (size!6736 (buf!7204 thiss!882))))))

(assert (= (and d!94230 res!228360) b!274490))

(assert (= (and b!274490 res!228361) b!274491))

(declare-fun m!407167 () Bool)

(assert (=> d!94230 m!407167))

(assert (=> d!94230 m!407155))

(assert (=> b!274475 d!94230))

(declare-fun d!94236 () Bool)

(assert (=> d!94236 (= (invariant!0 (currentBit!13308 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (currentByte!13313 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (size!6736 (buf!7204 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13308 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13308 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13313 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13313 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (size!6736 (buf!7204 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))))) (and (= (currentBit!13308 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13313 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000))) (size!6736 (buf!7204 (BitStream!12287 (buf!7204 thiss!882) (bvadd (currentByte!13313 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412622 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94214 d!94236))

(push 1)

(assert (not d!94230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

