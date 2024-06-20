; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54954 () Bool)

(assert start!54954)

(declare-fun b!256873 () Bool)

(declare-fun res!215290 () Bool)

(declare-fun e!178064 () Bool)

(assert (=> b!256873 (=> (not res!215290) (not e!178064))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13916 0))(
  ( (array!13917 (arr!7091 (Array (_ BitVec 32) (_ BitVec 8))) (size!6104 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11130 0))(
  ( (BitStream!11131 (buf!6626 array!13916) (currentByte!12135 (_ BitVec 32)) (currentBit!12130 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11130)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256873 (= res!215290 (validate_offset_bits!1 ((_ sign_extend 32) (size!6104 (buf!6626 thiss!1754))) ((_ sign_extend 32) (currentByte!12135 thiss!1754)) ((_ sign_extend 32) (currentBit!12130 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256875 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256875 (= e!178064 (not (invariant!0 (currentBit!12130 thiss!1754) (currentByte!12135 thiss!1754) (size!6104 (buf!6626 thiss!1754)))))))

(declare-fun lt!398219 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256875 (= lt!398219 (bitIndex!0 (size!6104 (buf!6626 thiss!1754)) (currentByte!12135 thiss!1754) (currentBit!12130 thiss!1754)))))

(declare-fun b!256874 () Bool)

(declare-fun res!215289 () Bool)

(assert (=> b!256874 (=> (not res!215289) (not e!178064))))

(assert (=> b!256874 (= res!215289 (= from!526 nBits!535))))

(declare-fun b!256876 () Bool)

(declare-fun e!178065 () Bool)

(declare-fun array_inv!5845 (array!13916) Bool)

(assert (=> b!256876 (= e!178065 (array_inv!5845 (buf!6626 thiss!1754)))))

(declare-fun res!215288 () Bool)

(assert (=> start!54954 (=> (not res!215288) (not e!178064))))

(assert (=> start!54954 (= res!215288 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54954 e!178064))

(assert (=> start!54954 true))

(declare-fun inv!12 (BitStream!11130) Bool)

(assert (=> start!54954 (and (inv!12 thiss!1754) e!178065)))

(assert (= (and start!54954 res!215288) b!256873))

(assert (= (and b!256873 res!215290) b!256874))

(assert (= (and b!256874 res!215289) b!256875))

(assert (= start!54954 b!256876))

(declare-fun m!386445 () Bool)

(assert (=> b!256873 m!386445))

(declare-fun m!386447 () Bool)

(assert (=> b!256875 m!386447))

(declare-fun m!386449 () Bool)

(assert (=> b!256875 m!386449))

(declare-fun m!386451 () Bool)

(assert (=> b!256876 m!386451))

(declare-fun m!386453 () Bool)

(assert (=> start!54954 m!386453))

(check-sat (not b!256873) (not b!256875) (not start!54954) (not b!256876))
(check-sat)
(get-model)

(declare-fun d!86200 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86200 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6104 (buf!6626 thiss!1754))) ((_ sign_extend 32) (currentByte!12135 thiss!1754)) ((_ sign_extend 32) (currentBit!12130 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6104 (buf!6626 thiss!1754))) ((_ sign_extend 32) (currentByte!12135 thiss!1754)) ((_ sign_extend 32) (currentBit!12130 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21794 () Bool)

(assert (= bs!21794 d!86200))

(declare-fun m!386467 () Bool)

(assert (=> bs!21794 m!386467))

(assert (=> b!256873 d!86200))

(declare-fun d!86206 () Bool)

(assert (=> d!86206 (= (invariant!0 (currentBit!12130 thiss!1754) (currentByte!12135 thiss!1754) (size!6104 (buf!6626 thiss!1754))) (and (bvsge (currentBit!12130 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12130 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12135 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12135 thiss!1754) (size!6104 (buf!6626 thiss!1754))) (and (= (currentBit!12130 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12135 thiss!1754) (size!6104 (buf!6626 thiss!1754)))))))))

(assert (=> b!256875 d!86206))

(declare-fun d!86210 () Bool)

(declare-fun e!178084 () Bool)

(assert (=> d!86210 e!178084))

(declare-fun res!215317 () Bool)

(assert (=> d!86210 (=> (not res!215317) (not e!178084))))

(declare-fun lt!398275 () (_ BitVec 64))

(declare-fun lt!398274 () (_ BitVec 64))

(declare-fun lt!398271 () (_ BitVec 64))

(assert (=> d!86210 (= res!215317 (= lt!398271 (bvsub lt!398274 lt!398275)))))

(assert (=> d!86210 (or (= (bvand lt!398274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!398275 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!398274 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!398274 lt!398275) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86210 (= lt!398275 (remainingBits!0 ((_ sign_extend 32) (size!6104 (buf!6626 thiss!1754))) ((_ sign_extend 32) (currentByte!12135 thiss!1754)) ((_ sign_extend 32) (currentBit!12130 thiss!1754))))))

(declare-fun lt!398272 () (_ BitVec 64))

(declare-fun lt!398273 () (_ BitVec 64))

(assert (=> d!86210 (= lt!398274 (bvmul lt!398272 lt!398273))))

(assert (=> d!86210 (or (= lt!398272 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!398273 (bvsdiv (bvmul lt!398272 lt!398273) lt!398272)))))

(assert (=> d!86210 (= lt!398273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86210 (= lt!398272 ((_ sign_extend 32) (size!6104 (buf!6626 thiss!1754))))))

(assert (=> d!86210 (= lt!398271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12135 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12130 thiss!1754))))))

(assert (=> d!86210 (invariant!0 (currentBit!12130 thiss!1754) (currentByte!12135 thiss!1754) (size!6104 (buf!6626 thiss!1754)))))

(assert (=> d!86210 (= (bitIndex!0 (size!6104 (buf!6626 thiss!1754)) (currentByte!12135 thiss!1754) (currentBit!12130 thiss!1754)) lt!398271)))

(declare-fun b!256905 () Bool)

(declare-fun res!215316 () Bool)

(assert (=> b!256905 (=> (not res!215316) (not e!178084))))

(assert (=> b!256905 (= res!215316 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398271))))

(declare-fun b!256906 () Bool)

(declare-fun lt!398276 () (_ BitVec 64))

(assert (=> b!256906 (= e!178084 (bvsle lt!398271 (bvmul lt!398276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!256906 (or (= lt!398276 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!398276 #b0000000000000000000000000000000000000000000000000000000000001000) lt!398276)))))

