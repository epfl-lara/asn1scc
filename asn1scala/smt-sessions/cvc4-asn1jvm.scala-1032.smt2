; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29630 () Bool)

(assert start!29630)

(declare-fun b!152773 () Bool)

(declare-fun res!128026 () Bool)

(declare-fun e!102282 () Bool)

(assert (=> b!152773 (=> (not res!128026) (not e!102282))))

(declare-fun lt!239209 () (_ BitVec 64))

(declare-datatypes ((array!6849 0))(
  ( (array!6850 (arr!3916 (Array (_ BitVec 32) (_ BitVec 8))) (size!3093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5444 0))(
  ( (BitStream!5445 (buf!3596 array!6849) (currentByte!6567 (_ BitVec 32)) (currentBit!6562 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5444)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152773 (= res!128026 (bvsle lt!239209 (bitIndex!0 (size!3093 (buf!3596 bs2!18)) (currentByte!6567 bs2!18) (currentBit!6562 bs2!18))))))

(declare-fun b!152774 () Bool)

(declare-fun e!102281 () Bool)

(declare-fun bs1!10 () BitStream!5444)

(declare-fun array_inv!2882 (array!6849) Bool)

(assert (=> b!152774 (= e!102281 (array_inv!2882 (buf!3596 bs1!10)))))

(declare-fun b!152775 () Bool)

(declare-fun e!102285 () Bool)

(assert (=> b!152775 (= e!102285 e!102282)))

(declare-fun res!128027 () Bool)

(assert (=> b!152775 (=> (not res!128027) (not e!102282))))

(assert (=> b!152775 (= res!128027 (bvsle lt!239209 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3093 (buf!3596 bs1!10))))))))

(assert (=> b!152775 (= lt!239209 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3093 (buf!3596 bs1!10)) (currentByte!6567 bs1!10) (currentBit!6562 bs1!10))))))

(declare-fun b!152776 () Bool)

(assert (=> b!152776 (= e!102282 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!239209))))

(declare-fun b!152777 () Bool)

(declare-fun e!102283 () Bool)

(assert (=> b!152777 (= e!102283 (array_inv!2882 (buf!3596 bs2!18)))))

(declare-fun res!128028 () Bool)

(assert (=> start!29630 (=> (not res!128028) (not e!102285))))

(assert (=> start!29630 (= res!128028 (= (size!3093 (buf!3596 bs1!10)) (size!3093 (buf!3596 bs2!18))))))

(assert (=> start!29630 e!102285))

(declare-fun inv!12 (BitStream!5444) Bool)

(assert (=> start!29630 (and (inv!12 bs1!10) e!102281)))

(assert (=> start!29630 (and (inv!12 bs2!18) e!102283)))

(assert (= (and start!29630 res!128028) b!152775))

(assert (= (and b!152775 res!128027) b!152773))

(assert (= (and b!152773 res!128026) b!152776))

(assert (= start!29630 b!152774))

(assert (= start!29630 b!152777))

(declare-fun m!238609 () Bool)

(assert (=> b!152775 m!238609))

(declare-fun m!238611 () Bool)

(assert (=> start!29630 m!238611))

(declare-fun m!238613 () Bool)

(assert (=> start!29630 m!238613))

(declare-fun m!238615 () Bool)

(assert (=> b!152777 m!238615))

(declare-fun m!238617 () Bool)

(assert (=> b!152774 m!238617))

(declare-fun m!238619 () Bool)

(assert (=> b!152773 m!238619))

(push 1)

(assert (not start!29630))

(assert (not b!152775))

(assert (not b!152774))

(assert (not b!152773))

(assert (not b!152777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50228 () Bool)

(assert (=> d!50228 (= (array_inv!2882 (buf!3596 bs1!10)) (bvsge (size!3093 (buf!3596 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152774 d!50228))

(declare-fun d!50230 () Bool)

(declare-fun e!102296 () Bool)

(assert (=> d!50230 e!102296))

(declare-fun res!128050 () Bool)

(assert (=> d!50230 (=> (not res!128050) (not e!102296))))

(declare-fun lt!239270 () (_ BitVec 64))

(declare-fun lt!239274 () (_ BitVec 64))

(declare-fun lt!239273 () (_ BitVec 64))

(assert (=> d!50230 (= res!128050 (= lt!239273 (bvsub lt!239274 lt!239270)))))

(assert (=> d!50230 (or (= (bvand lt!239274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239270 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239274 lt!239270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50230 (= lt!239270 (remainingBits!0 ((_ sign_extend 32) (size!3093 (buf!3596 bs2!18))) ((_ sign_extend 32) (currentByte!6567 bs2!18)) ((_ sign_extend 32) (currentBit!6562 bs2!18))))))

(declare-fun lt!239271 () (_ BitVec 64))

(declare-fun lt!239272 () (_ BitVec 64))

(assert (=> d!50230 (= lt!239274 (bvmul lt!239271 lt!239272))))

(assert (=> d!50230 (or (= lt!239271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239272 (bvsdiv (bvmul lt!239271 lt!239272) lt!239271)))))

(assert (=> d!50230 (= lt!239272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50230 (= lt!239271 ((_ sign_extend 32) (size!3093 (buf!3596 bs2!18))))))

(assert (=> d!50230 (= lt!239273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6567 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6562 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50230 (invariant!0 (currentBit!6562 bs2!18) (currentByte!6567 bs2!18) (size!3093 (buf!3596 bs2!18)))))

(assert (=> d!50230 (= (bitIndex!0 (size!3093 (buf!3596 bs2!18)) (currentByte!6567 bs2!18) (currentBit!6562 bs2!18)) lt!239273)))

(declare-fun b!152798 () Bool)

(declare-fun res!128049 () Bool)

(assert (=> b!152798 (=> (not res!128049) (not e!102296))))

(assert (=> b!152798 (= res!128049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239273))))

(declare-fun b!152799 () Bool)

(declare-fun lt!239275 () (_ BitVec 64))

(assert (=> b!152799 (= e!102296 (bvsle lt!239273 (bvmul lt!239275 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152799 (or (= lt!239275 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239275 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239275)))))

(assert (=> b!152799 (= lt!239275 ((_ sign_extend 32) (size!3093 (buf!3596 bs2!18))))))

(assert (= (and d!50230 res!128050) b!152798))

(assert (= (and b!152798 res!128049) b!152799))

(declare-fun m!238637 () Bool)

(assert (=> d!50230 m!238637))

(declare-fun m!238639 () Bool)

(assert (=> d!50230 m!238639))

(assert (=> b!152773 d!50230))

(declare-fun d!50250 () Bool)

(assert (=> d!50250 (= (array_inv!2882 (buf!3596 bs2!18)) (bvsge (size!3093 (buf!3596 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152777 d!50250))

(declare-fun d!50252 () Bool)

(declare-fun e!102297 () Bool)

(assert (=> d!50252 e!102297))

(declare-fun res!128052 () Bool)

(assert (=> d!50252 (=> (not res!128052) (not e!102297))))

(declare-fun lt!239276 () (_ BitVec 64))

(declare-fun lt!239280 () (_ BitVec 64))

(declare-fun lt!239279 () (_ BitVec 64))

(assert (=> d!50252 (= res!128052 (= lt!239279 (bvsub lt!239280 lt!239276)))))

(assert (=> d!50252 (or (= (bvand lt!239280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239280 lt!239276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50252 (= lt!239276 (remainingBits!0 ((_ sign_extend 32) (size!3093 (buf!3596 bs1!10))) ((_ sign_extend 32) (currentByte!6567 bs1!10)) ((_ sign_extend 32) (currentBit!6562 bs1!10))))))

(declare-fun lt!239277 () (_ BitVec 64))

(declare-fun lt!239278 () (_ BitVec 64))

(assert (=> d!50252 (= lt!239280 (bvmul lt!239277 lt!239278))))

(assert (=> d!50252 (or (= lt!239277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239278 (bvsdiv (bvmul lt!239277 lt!239278) lt!239277)))))

(assert (=> d!50252 (= lt!239278 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50252 (= lt!239277 ((_ sign_extend 32) (size!3093 (buf!3596 bs1!10))))))

(assert (=> d!50252 (= lt!239279 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6567 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6562 bs1!10))))))

(assert (=> d!50252 (invariant!0 (currentBit!6562 bs1!10) (currentByte!6567 bs1!10) (size!3093 (buf!3596 bs1!10)))))

(assert (=> d!50252 (= (bitIndex!0 (size!3093 (buf!3596 bs1!10)) (currentByte!6567 bs1!10) (currentBit!6562 bs1!10)) lt!239279)))

(declare-fun b!152800 () Bool)

(declare-fun res!128051 () Bool)

(assert (=> b!152800 (=> (not res!128051) (not e!102297))))

(assert (=> b!152800 (= res!128051 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239279))))

(declare-fun b!152801 () Bool)

(declare-fun lt!239281 () (_ BitVec 64))

(assert (=> b!152801 (= e!102297 (bvsle lt!239279 (bvmul lt!239281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152801 (or (= lt!239281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239281)))))

(assert (=> b!152801 (= lt!239281 ((_ sign_extend 32) (size!3093 (buf!3596 bs1!10))))))

(assert (= (and d!50252 res!128052) b!152800))

(assert (= (and b!152800 res!128051) b!152801))

(declare-fun m!238641 () Bool)

(assert (=> d!50252 m!238641))

(declare-fun m!238643 () Bool)

(assert (=> d!50252 m!238643))

(assert (=> b!152775 d!50252))

(declare-fun d!50254 () Bool)

(assert (=> d!50254 (= (inv!12 bs1!10) (invariant!0 (currentBit!6562 bs1!10) (currentByte!6567 bs1!10) (size!3093 (buf!3596 bs1!10))))))

(declare-fun bs!12285 () Bool)

(assert (= bs!12285 d!50254))

(assert (=> bs!12285 m!238643))

(assert (=> start!29630 d!50254))

(declare-fun d!50256 () Bool)

(assert (=> d!50256 (= (inv!12 bs2!18) (invariant!0 (currentBit!6562 bs2!18) (currentByte!6567 bs2!18) (size!3093 (buf!3596 bs2!18))))))

(declare-fun bs!12286 () Bool)

(assert (= bs!12286 d!50256))

(assert (=> bs!12286 m!238639))

(assert (=> start!29630 d!50256))

(push 1)

(assert (not d!50256))

(assert (not d!50254))

(assert (not d!50230))

(assert (not d!50252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

