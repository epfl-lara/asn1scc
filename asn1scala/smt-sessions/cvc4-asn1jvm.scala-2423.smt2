; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61814 () Bool)

(assert start!61814)

(declare-fun b!277125 () Bool)

(declare-fun e!197094 () Bool)

(declare-datatypes ((array!15890 0))(
  ( (array!15891 (arr!7872 (Array (_ BitVec 32) (_ BitVec 8))) (size!6876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12566 0))(
  ( (BitStream!12567 (buf!7344 array!15890) (currentByte!13606 (_ BitVec 32)) (currentBit!13601 (_ BitVec 32))) )
))
(declare-fun b2!124 () BitStream!12566)

(declare-fun array_inv!6600 (array!15890) Bool)

(assert (=> b!277125 (= e!197094 (array_inv!6600 (buf!7344 b2!124)))))

(declare-fun b!277124 () Bool)

(declare-fun e!197098 () Bool)

(declare-fun thiss!872 () BitStream!12566)

(assert (=> b!277124 (= e!197098 (array_inv!6600 (buf!7344 thiss!872)))))

(declare-fun b!277122 () Bool)

(declare-fun e!197096 () Bool)

(declare-fun e!197099 () Bool)

(assert (=> b!277122 (= e!197096 e!197099)))

(declare-fun res!230151 () Bool)

(assert (=> b!277122 (=> (not res!230151) (not e!197099))))

(declare-fun lt!415248 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277122 (= res!230151 (bvsle lt!415248 (bitIndex!0 (size!6876 (buf!7344 b2!124)) (currentByte!13606 b2!124) (currentBit!13601 b2!124))))))

(assert (=> b!277122 (= lt!415248 (bitIndex!0 (size!6876 (buf!7344 thiss!872)) (currentByte!13606 thiss!872) (currentBit!13601 thiss!872)))))

(declare-fun b!277123 () Bool)

(assert (=> b!277123 (= e!197099 (and (not (= (size!6876 (buf!7344 thiss!872)) #b00000000000000000000000000000000)) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!415248) (bvsgt lt!415248 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6876 (buf!7344 thiss!872))))))))))

(declare-fun res!230152 () Bool)

(assert (=> start!61814 (=> (not res!230152) (not e!197096))))

(assert (=> start!61814 (= res!230152 (= (size!6876 (buf!7344 thiss!872)) (size!6876 (buf!7344 b2!124))))))

(assert (=> start!61814 e!197096))

(declare-fun inv!12 (BitStream!12566) Bool)

(assert (=> start!61814 (and (inv!12 thiss!872) e!197098)))

(assert (=> start!61814 (and (inv!12 b2!124) e!197094)))

(assert (= (and start!61814 res!230152) b!277122))

(assert (= (and b!277122 res!230151) b!277123))

(assert (= start!61814 b!277124))

(assert (= start!61814 b!277125))

(declare-fun m!410333 () Bool)

(assert (=> b!277125 m!410333))

(declare-fun m!410335 () Bool)

(assert (=> b!277124 m!410335))

(declare-fun m!410337 () Bool)

(assert (=> b!277122 m!410337))

(declare-fun m!410339 () Bool)

(assert (=> b!277122 m!410339))

(declare-fun m!410341 () Bool)

(assert (=> start!61814 m!410341))

(declare-fun m!410343 () Bool)

(assert (=> start!61814 m!410343))

(push 1)

(assert (not start!61814))

(assert (not b!277124))

(assert (not b!277125))

(assert (not b!277122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95634 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!95634 (= (inv!12 thiss!872) (invariant!0 (currentBit!13601 thiss!872) (currentByte!13606 thiss!872) (size!6876 (buf!7344 thiss!872))))))

(declare-fun bs!24119 () Bool)

(assert (= bs!24119 d!95634))

(declare-fun m!410353 () Bool)

(assert (=> bs!24119 m!410353))

(assert (=> start!61814 d!95634))

(declare-fun d!95638 () Bool)

(assert (=> d!95638 (= (inv!12 b2!124) (invariant!0 (currentBit!13601 b2!124) (currentByte!13606 b2!124) (size!6876 (buf!7344 b2!124))))))

(declare-fun bs!24120 () Bool)

(assert (= bs!24120 d!95638))

(declare-fun m!410355 () Bool)

(assert (=> bs!24120 m!410355))

(assert (=> start!61814 d!95638))

(declare-fun d!95640 () Bool)

(assert (=> d!95640 (= (array_inv!6600 (buf!7344 thiss!872)) (bvsge (size!6876 (buf!7344 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!277124 d!95640))

(declare-fun d!95642 () Bool)

(assert (=> d!95642 (= (array_inv!6600 (buf!7344 b2!124)) (bvsge (size!6876 (buf!7344 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!277125 d!95642))

(declare-fun d!95644 () Bool)

(declare-fun e!197110 () Bool)

(assert (=> d!95644 e!197110))

(declare-fun res!230173 () Bool)

(assert (=> d!95644 (=> (not res!230173) (not e!197110))))

(declare-fun lt!415311 () (_ BitVec 64))

(declare-fun lt!415312 () (_ BitVec 64))

(declare-fun lt!415309 () (_ BitVec 64))

(assert (=> d!95644 (= res!230173 (= lt!415312 (bvsub lt!415311 lt!415309)))))

(assert (=> d!95644 (or (= (bvand lt!415311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415311 lt!415309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95644 (= lt!415309 (remainingBits!0 ((_ sign_extend 32) (size!6876 (buf!7344 b2!124))) ((_ sign_extend 32) (currentByte!13606 b2!124)) ((_ sign_extend 32) (currentBit!13601 b2!124))))))

(declare-fun lt!415313 () (_ BitVec 64))

(declare-fun lt!415310 () (_ BitVec 64))

(assert (=> d!95644 (= lt!415311 (bvmul lt!415313 lt!415310))))

(assert (=> d!95644 (or (= lt!415313 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415310 (bvsdiv (bvmul lt!415313 lt!415310) lt!415313)))))

(assert (=> d!95644 (= lt!415310 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95644 (= lt!415313 ((_ sign_extend 32) (size!6876 (buf!7344 b2!124))))))

(assert (=> d!95644 (= lt!415312 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13606 b2!124)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13601 b2!124))))))

(assert (=> d!95644 (invariant!0 (currentBit!13601 b2!124) (currentByte!13606 b2!124) (size!6876 (buf!7344 b2!124)))))

(assert (=> d!95644 (= (bitIndex!0 (size!6876 (buf!7344 b2!124)) (currentByte!13606 b2!124) (currentBit!13601 b2!124)) lt!415312)))

(declare-fun b!277146 () Bool)

(declare-fun res!230174 () Bool)

(assert (=> b!277146 (=> (not res!230174) (not e!197110))))

(assert (=> b!277146 (= res!230174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415312))))

(declare-fun b!277147 () Bool)

(declare-fun lt!415314 () (_ BitVec 64))

(assert (=> b!277147 (= e!197110 (bvsle lt!415312 (bvmul lt!415314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277147 (or (= lt!415314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415314)))))

(assert (=> b!277147 (= lt!415314 ((_ sign_extend 32) (size!6876 (buf!7344 b2!124))))))

(assert (= (and d!95644 res!230173) b!277146))

(assert (= (and b!277146 res!230174) b!277147))

(declare-fun m!410365 () Bool)

(assert (=> d!95644 m!410365))

(assert (=> d!95644 m!410355))

(assert (=> b!277122 d!95644))

(declare-fun d!95656 () Bool)

(declare-fun e!197111 () Bool)

(assert (=> d!95656 e!197111))

(declare-fun res!230175 () Bool)

(assert (=> d!95656 (=> (not res!230175) (not e!197111))))

(declare-fun lt!415317 () (_ BitVec 64))

(declare-fun lt!415315 () (_ BitVec 64))

(declare-fun lt!415318 () (_ BitVec 64))

(assert (=> d!95656 (= res!230175 (= lt!415318 (bvsub lt!415317 lt!415315)))))

(assert (=> d!95656 (or (= (bvand lt!415317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415317 lt!415315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95656 (= lt!415315 (remainingBits!0 ((_ sign_extend 32) (size!6876 (buf!7344 thiss!872))) ((_ sign_extend 32) (currentByte!13606 thiss!872)) ((_ sign_extend 32) (currentBit!13601 thiss!872))))))

(declare-fun lt!415319 () (_ BitVec 64))

(declare-fun lt!415316 () (_ BitVec 64))

(assert (=> d!95656 (= lt!415317 (bvmul lt!415319 lt!415316))))

(assert (=> d!95656 (or (= lt!415319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415316 (bvsdiv (bvmul lt!415319 lt!415316) lt!415319)))))

(assert (=> d!95656 (= lt!415316 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95656 (= lt!415319 ((_ sign_extend 32) (size!6876 (buf!7344 thiss!872))))))

(assert (=> d!95656 (= lt!415318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13606 thiss!872)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13601 thiss!872))))))

(assert (=> d!95656 (invariant!0 (currentBit!13601 thiss!872) (currentByte!13606 thiss!872) (size!6876 (buf!7344 thiss!872)))))

(assert (=> d!95656 (= (bitIndex!0 (size!6876 (buf!7344 thiss!872)) (currentByte!13606 thiss!872) (currentBit!13601 thiss!872)) lt!415318)))

(declare-fun b!277148 () Bool)

(declare-fun res!230176 () Bool)

(assert (=> b!277148 (=> (not res!230176) (not e!197111))))

(assert (=> b!277148 (= res!230176 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415318))))

(declare-fun b!277149 () Bool)

(declare-fun lt!415320 () (_ BitVec 64))

(assert (=> b!277149 (= e!197111 (bvsle lt!415318 (bvmul lt!415320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277149 (or (= lt!415320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415320)))))

(assert (=> b!277149 (= lt!415320 ((_ sign_extend 32) (size!6876 (buf!7344 thiss!872))))))

(assert (= (and d!95656 res!230175) b!277148))

(assert (= (and b!277148 res!230176) b!277149))

(declare-fun m!410367 () Bool)

(assert (=> d!95656 m!410367))

(assert (=> d!95656 m!410353))

(assert (=> b!277122 d!95656))

(push 1)

(assert (not d!95638))

(assert (not d!95656))

(assert (not d!95644))

(assert (not d!95634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

