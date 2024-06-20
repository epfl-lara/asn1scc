; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60810 () Bool)

(assert start!60810)

(declare-fun res!228498 () Bool)

(declare-fun e!194560 () Bool)

(assert (=> start!60810 (=> (not res!228498) (not e!194560))))

(declare-datatypes ((array!15576 0))(
  ( (array!15577 (arr!7738 (Array (_ BitVec 32) (_ BitVec 8))) (size!6751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12316 0))(
  ( (BitStream!12317 (buf!7219 array!15576) (currentByte!13352 (_ BitVec 32)) (currentBit!13347 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12316)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12316 (_ BitVec 64)) Bool)

(assert (=> start!60810 (= res!228498 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60810 e!194560))

(declare-fun e!194562 () Bool)

(declare-fun inv!12 (BitStream!12316) Bool)

(assert (=> start!60810 (and (inv!12 thiss!882) e!194562)))

(assert (=> start!60810 true))

(declare-fun b!274675 () Bool)

(declare-fun e!194561 () Bool)

(assert (=> b!274675 (= e!194560 e!194561)))

(declare-fun res!228499 () Bool)

(assert (=> b!274675 (=> (not res!228499) (not e!194561))))

(declare-fun lt!412942 () (_ BitVec 32))

(assert (=> b!274675 (= res!228499 (and (bvsge lt!412942 #b00000000000000000000000000000000) (bvsge lt!412942 #b00000000000000000000000000001000)))))

(assert (=> b!274675 (= lt!412942 (bvadd (currentBit!13347 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!412943 () (_ BitVec 64))

(declare-fun b!274676 () Bool)

(declare-fun lt!412941 () (_ BitVec 64))

(assert (=> b!274676 (= e!194561 (and (= lt!412943 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412943 (bvand (bvadd lt!412941 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274676 (= lt!412943 (bvand lt!412941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274676 (= lt!412941 (bitIndex!0 (size!6751 (buf!7219 thiss!882)) (currentByte!13352 thiss!882) (currentBit!13347 thiss!882)))))

(declare-fun b!274677 () Bool)

(declare-fun array_inv!6475 (array!15576) Bool)

(assert (=> b!274677 (= e!194562 (array_inv!6475 (buf!7219 thiss!882)))))

(assert (= (and start!60810 res!228498) b!274675))

(assert (= (and b!274675 res!228499) b!274676))

(assert (= start!60810 b!274677))

(declare-fun m!407309 () Bool)

(assert (=> start!60810 m!407309))

(declare-fun m!407311 () Bool)

(assert (=> start!60810 m!407311))

(declare-fun m!407313 () Bool)

(assert (=> b!274676 m!407313))

(declare-fun m!407315 () Bool)

(assert (=> b!274677 m!407315))

(push 1)

(assert (not b!274676))

(assert (not start!60810))

(assert (not b!274677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94364 () Bool)

(declare-fun e!194596 () Bool)

(assert (=> d!94364 e!194596))

(declare-fun res!228526 () Bool)

(assert (=> d!94364 (=> (not res!228526) (not e!194596))))

(declare-fun lt!412999 () (_ BitVec 64))

(declare-fun lt!413000 () (_ BitVec 64))

(declare-fun lt!412998 () (_ BitVec 64))

(assert (=> d!94364 (= res!228526 (= lt!412998 (bvsub lt!412999 lt!413000)))))

(assert (=> d!94364 (or (= (bvand lt!412999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412999 lt!413000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94364 (= lt!413000 (remainingBits!0 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882))) ((_ sign_extend 32) (currentByte!13352 thiss!882)) ((_ sign_extend 32) (currentBit!13347 thiss!882))))))

(declare-fun lt!412995 () (_ BitVec 64))

(declare-fun lt!412997 () (_ BitVec 64))

(assert (=> d!94364 (= lt!412999 (bvmul lt!412995 lt!412997))))

(assert (=> d!94364 (or (= lt!412995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412997 (bvsdiv (bvmul lt!412995 lt!412997) lt!412995)))))

(assert (=> d!94364 (= lt!412997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94364 (= lt!412995 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882))))))

(assert (=> d!94364 (= lt!412998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13352 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13347 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94364 (invariant!0 (currentBit!13347 thiss!882) (currentByte!13352 thiss!882) (size!6751 (buf!7219 thiss!882)))))

(assert (=> d!94364 (= (bitIndex!0 (size!6751 (buf!7219 thiss!882)) (currentByte!13352 thiss!882) (currentBit!13347 thiss!882)) lt!412998)))

(declare-fun b!274710 () Bool)

(declare-fun res!228525 () Bool)

(assert (=> b!274710 (=> (not res!228525) (not e!194596))))

(assert (=> b!274710 (= res!228525 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412998))))

(declare-fun b!274711 () Bool)

(declare-fun lt!412996 () (_ BitVec 64))

(assert (=> b!274711 (= e!194596 (bvsle lt!412998 (bvmul lt!412996 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274711 (or (= lt!412996 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412996 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412996)))))

(assert (=> b!274711 (= lt!412996 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882))))))

(assert (= (and d!94364 res!228526) b!274710))

(assert (= (and b!274710 res!228525) b!274711))

(declare-fun m!407337 () Bool)

(assert (=> d!94364 m!407337))

(declare-fun m!407339 () Bool)

(assert (=> d!94364 m!407339))

(assert (=> b!274676 d!94364))

(declare-fun d!94368 () Bool)

(declare-fun res!228535 () Bool)

(declare-fun e!194602 () Bool)

(assert (=> d!94368 (=> (not res!228535) (not e!194602))))

(assert (=> d!94368 (= res!228535 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882)))))))))

(assert (=> d!94368 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194602)))

(declare-fun b!274721 () Bool)

(declare-fun lt!413021 () (_ BitVec 64))

(assert (=> b!274721 (= e!194602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413021) (bvsle lt!413021 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6751 (buf!7219 thiss!882)))))))))

(assert (=> b!274721 (= lt!413021 (bvadd (bitIndex!0 (size!6751 (buf!7219 thiss!882)) (currentByte!13352 thiss!882) (currentBit!13347 thiss!882)) diffInBits!15))))

(assert (= (and d!94368 res!228535) b!274721))

(assert (=> b!274721 m!407313))

(assert (=> start!60810 d!94368))

(declare-fun d!94372 () Bool)

(assert (=> d!94372 (= (inv!12 thiss!882) (invariant!0 (currentBit!13347 thiss!882) (currentByte!13352 thiss!882) (size!6751 (buf!7219 thiss!882))))))

(declare-fun bs!23760 () Bool)

(assert (= bs!23760 d!94372))

(assert (=> bs!23760 m!407339))

(assert (=> start!60810 d!94372))

(declare-fun d!94374 () Bool)

(assert (=> d!94374 (= (array_inv!6475 (buf!7219 thiss!882)) (bvsge (size!6751 (buf!7219 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274677 d!94374))

(push 1)

(assert (not d!94372))

(assert (not b!274721))

(assert (not d!94364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

