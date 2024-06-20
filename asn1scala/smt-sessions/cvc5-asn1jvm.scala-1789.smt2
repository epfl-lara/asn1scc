; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48786 () Bool)

(assert start!48786)

(declare-fun b!230909 () Bool)

(declare-fun e!158705 () Bool)

(declare-datatypes ((array!11806 0))(
  ( (array!11807 (arr!6160 (Array (_ BitVec 32) (_ BitVec 8))) (size!5173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9442 0))(
  ( (BitStream!9443 (buf!5714 array!11806) (currentByte!10709 (_ BitVec 32)) (currentBit!10704 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9442)

(declare-fun array_inv!4914 (array!11806) Bool)

(assert (=> b!230909 (= e!158705 (array_inv!4914 (buf!5714 b2!99)))))

(declare-fun b!230907 () Bool)

(declare-fun e!158704 () Bool)

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!230907 (= e!158704 (bvsge (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!230906 () Bool)

(declare-fun res!193478 () Bool)

(assert (=> b!230906 (=> (not res!193478) (not e!158704))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230906 (= res!193478 (bvsle bits!86 (bitIndex!0 (size!5173 (buf!5714 b2!99)) (currentByte!10709 b2!99) (currentBit!10704 b2!99))))))

(declare-fun res!193479 () Bool)

(assert (=> start!48786 (=> (not res!193479) (not e!158704))))

(declare-fun b1!101 () BitStream!9442)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48786 (= res!193479 (and (= (size!5173 (buf!5714 b1!101)) (size!5173 (buf!5714 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48786 e!158704))

(declare-fun e!158701 () Bool)

(declare-fun inv!12 (BitStream!9442) Bool)

(assert (=> start!48786 (and (inv!12 b1!101) e!158701)))

(assert (=> start!48786 (and (inv!12 b2!99) e!158705)))

(assert (=> start!48786 true))

(declare-fun b!230908 () Bool)

(assert (=> b!230908 (= e!158701 (array_inv!4914 (buf!5714 b1!101)))))

(assert (= (and start!48786 res!193479) b!230906))

(assert (= (and b!230906 res!193478) b!230907))

(assert (= start!48786 b!230908))

(assert (= start!48786 b!230909))

(declare-fun m!354137 () Bool)

(assert (=> b!230909 m!354137))

(declare-fun m!354139 () Bool)

(assert (=> b!230906 m!354139))

(declare-fun m!354141 () Bool)

(assert (=> start!48786 m!354141))

(declare-fun m!354143 () Bool)

(assert (=> start!48786 m!354143))

(declare-fun m!354145 () Bool)

(assert (=> b!230908 m!354145))

(push 1)

(assert (not b!230909))

(assert (not start!48786))

(assert (not b!230908))

(assert (not b!230906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78356 () Bool)

(assert (=> d!78356 (= (array_inv!4914 (buf!5714 b2!99)) (bvsge (size!5173 (buf!5714 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!230909 d!78356))

(declare-fun d!78358 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78358 (= (inv!12 b1!101) (invariant!0 (currentBit!10704 b1!101) (currentByte!10709 b1!101) (size!5173 (buf!5714 b1!101))))))

(declare-fun bs!19215 () Bool)

(assert (= bs!19215 d!78358))

(declare-fun m!354173 () Bool)

(assert (=> bs!19215 m!354173))

(assert (=> start!48786 d!78358))

(declare-fun d!78360 () Bool)

(assert (=> d!78360 (= (inv!12 b2!99) (invariant!0 (currentBit!10704 b2!99) (currentByte!10709 b2!99) (size!5173 (buf!5714 b2!99))))))

(declare-fun bs!19216 () Bool)

(assert (= bs!19216 d!78360))

(declare-fun m!354175 () Bool)

(assert (=> bs!19216 m!354175))

(assert (=> start!48786 d!78360))

(declare-fun d!78362 () Bool)

(assert (=> d!78362 (= (array_inv!4914 (buf!5714 b1!101)) (bvsge (size!5173 (buf!5714 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!230908 d!78362))

(declare-fun d!78364 () Bool)

(declare-fun e!158741 () Bool)

(assert (=> d!78364 e!158741))

(declare-fun res!193503 () Bool)

(assert (=> d!78364 (=> (not res!193503) (not e!158741))))

(declare-fun lt!368424 () (_ BitVec 64))

(declare-fun lt!368422 () (_ BitVec 64))

(declare-fun lt!368426 () (_ BitVec 64))

(assert (=> d!78364 (= res!193503 (= lt!368422 (bvsub lt!368424 lt!368426)))))

(assert (=> d!78364 (or (= (bvand lt!368424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368426 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368424 lt!368426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78364 (= lt!368426 (remainingBits!0 ((_ sign_extend 32) (size!5173 (buf!5714 b2!99))) ((_ sign_extend 32) (currentByte!10709 b2!99)) ((_ sign_extend 32) (currentBit!10704 b2!99))))))

(declare-fun lt!368425 () (_ BitVec 64))

(declare-fun lt!368427 () (_ BitVec 64))

(assert (=> d!78364 (= lt!368424 (bvmul lt!368425 lt!368427))))

(assert (=> d!78364 (or (= lt!368425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368427 (bvsdiv (bvmul lt!368425 lt!368427) lt!368425)))))

(assert (=> d!78364 (= lt!368427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78364 (= lt!368425 ((_ sign_extend 32) (size!5173 (buf!5714 b2!99))))))

(assert (=> d!78364 (= lt!368422 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10709 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10704 b2!99))))))

(assert (=> d!78364 (invariant!0 (currentBit!10704 b2!99) (currentByte!10709 b2!99) (size!5173 (buf!5714 b2!99)))))

(assert (=> d!78364 (= (bitIndex!0 (size!5173 (buf!5714 b2!99)) (currentByte!10709 b2!99) (currentBit!10704 b2!99)) lt!368422)))

(declare-fun b!230944 () Bool)

(declare-fun res!193502 () Bool)

(assert (=> b!230944 (=> (not res!193502) (not e!158741))))

(assert (=> b!230944 (= res!193502 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368422))))

(declare-fun b!230945 () Bool)

(declare-fun lt!368423 () (_ BitVec 64))

(assert (=> b!230945 (= e!158741 (bvsle lt!368422 (bvmul lt!368423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!230945 (or (= lt!368423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368423)))))

(assert (=> b!230945 (= lt!368423 ((_ sign_extend 32) (size!5173 (buf!5714 b2!99))))))

(assert (= (and d!78364 res!193503) b!230944))

(assert (= (and b!230944 res!193502) b!230945))

(declare-fun m!354177 () Bool)

(assert (=> d!78364 m!354177))

(assert (=> d!78364 m!354175))

(assert (=> b!230906 d!78364))

(push 1)

(assert (not d!78360))

(assert (not d!78364))

(assert (not d!78358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

