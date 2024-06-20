; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29594 () Bool)

(assert start!29594)

(declare-fun b!152668 () Bool)

(declare-fun e!102172 () Bool)

(declare-datatypes ((array!6834 0))(
  ( (array!6835 (arr!3910 (Array (_ BitVec 32) (_ BitVec 8))) (size!3087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5432 0))(
  ( (BitStream!5433 (buf!3590 array!6834) (currentByte!6555 (_ BitVec 32)) (currentBit!6550 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5432)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152668 (= e!102172 (not (invariant!0 (currentBit!6550 bs1!10) (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10)))))))

(declare-fun b!152669 () Bool)

(declare-fun res!127959 () Bool)

(assert (=> b!152669 (=> (not res!127959) (not e!102172))))

(declare-fun lt!239119 () (_ BitVec 64))

(declare-fun bs2!18 () BitStream!5432)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152669 (= res!127959 (bvsle lt!239119 (bitIndex!0 (size!3087 (buf!3590 bs2!18)) (currentByte!6555 bs2!18) (currentBit!6550 bs2!18))))))

(declare-fun b!152670 () Bool)

(declare-fun e!102174 () Bool)

(declare-fun array_inv!2876 (array!6834) Bool)

(assert (=> b!152670 (= e!102174 (array_inv!2876 (buf!3590 bs2!18)))))

(declare-fun b!152671 () Bool)

(declare-fun e!102169 () Bool)

(assert (=> b!152671 (= e!102169 (array_inv!2876 (buf!3590 bs1!10)))))

(declare-fun b!152672 () Bool)

(declare-fun e!102173 () Bool)

(assert (=> b!152672 (= e!102173 e!102172)))

(declare-fun res!127957 () Bool)

(assert (=> b!152672 (=> (not res!127957) (not e!102172))))

(assert (=> b!152672 (= res!127957 (bvsle lt!239119 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3087 (buf!3590 bs1!10))))))))

(assert (=> b!152672 (= lt!239119 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3087 (buf!3590 bs1!10)) (currentByte!6555 bs1!10) (currentBit!6550 bs1!10))))))

(declare-fun res!127958 () Bool)

(assert (=> start!29594 (=> (not res!127958) (not e!102173))))

(assert (=> start!29594 (= res!127958 (= (size!3087 (buf!3590 bs1!10)) (size!3087 (buf!3590 bs2!18))))))

(assert (=> start!29594 e!102173))

(declare-fun inv!12 (BitStream!5432) Bool)

(assert (=> start!29594 (and (inv!12 bs1!10) e!102169)))

(assert (=> start!29594 (and (inv!12 bs2!18) e!102174)))

(assert (= (and start!29594 res!127958) b!152672))

(assert (= (and b!152672 res!127957) b!152669))

(assert (= (and b!152669 res!127959) b!152668))

(assert (= start!29594 b!152671))

(assert (= start!29594 b!152670))

(declare-fun m!238517 () Bool)

(assert (=> b!152672 m!238517))

(declare-fun m!238519 () Bool)

(assert (=> b!152669 m!238519))

(declare-fun m!238521 () Bool)

(assert (=> b!152668 m!238521))

(declare-fun m!238523 () Bool)

(assert (=> start!29594 m!238523))

(declare-fun m!238525 () Bool)

(assert (=> start!29594 m!238525))

(declare-fun m!238527 () Bool)

(assert (=> b!152670 m!238527))

(declare-fun m!238529 () Bool)

(assert (=> b!152671 m!238529))

(push 1)

(assert (not start!29594))

(assert (not b!152672))

(assert (not b!152671))

(assert (not b!152670))

(assert (not b!152668))

(assert (not b!152669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50186 () Bool)

(assert (=> d!50186 (= (array_inv!2876 (buf!3590 bs1!10)) (bvsge (size!3087 (buf!3590 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152671 d!50186))

(declare-fun d!50190 () Bool)

(declare-fun e!102185 () Bool)

(assert (=> d!50190 e!102185))

(declare-fun res!127981 () Bool)

(assert (=> d!50190 (=> (not res!127981) (not e!102185))))

(declare-fun lt!239184 () (_ BitVec 64))

(declare-fun lt!239181 () (_ BitVec 64))

(declare-fun lt!239180 () (_ BitVec 64))

(assert (=> d!50190 (= res!127981 (= lt!239184 (bvsub lt!239181 lt!239180)))))

(assert (=> d!50190 (or (= (bvand lt!239181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239181 lt!239180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50190 (= lt!239180 (remainingBits!0 ((_ sign_extend 32) (size!3087 (buf!3590 bs1!10))) ((_ sign_extend 32) (currentByte!6555 bs1!10)) ((_ sign_extend 32) (currentBit!6550 bs1!10))))))

(declare-fun lt!239182 () (_ BitVec 64))

(declare-fun lt!239183 () (_ BitVec 64))

(assert (=> d!50190 (= lt!239181 (bvmul lt!239182 lt!239183))))

(assert (=> d!50190 (or (= lt!239182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239183 (bvsdiv (bvmul lt!239182 lt!239183) lt!239182)))))

(assert (=> d!50190 (= lt!239183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50190 (= lt!239182 ((_ sign_extend 32) (size!3087 (buf!3590 bs1!10))))))

(assert (=> d!50190 (= lt!239184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6555 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6550 bs1!10))))))

(assert (=> d!50190 (invariant!0 (currentBit!6550 bs1!10) (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10)))))

(assert (=> d!50190 (= (bitIndex!0 (size!3087 (buf!3590 bs1!10)) (currentByte!6555 bs1!10) (currentBit!6550 bs1!10)) lt!239184)))

(declare-fun b!152693 () Bool)

(declare-fun res!127980 () Bool)

(assert (=> b!152693 (=> (not res!127980) (not e!102185))))

(assert (=> b!152693 (= res!127980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239184))))

(declare-fun b!152694 () Bool)

(declare-fun lt!239185 () (_ BitVec 64))

(assert (=> b!152694 (= e!102185 (bvsle lt!239184 (bvmul lt!239185 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152694 (or (= lt!239185 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239185 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239185)))))

(assert (=> b!152694 (= lt!239185 ((_ sign_extend 32) (size!3087 (buf!3590 bs1!10))))))

(assert (= (and d!50190 res!127981) b!152693))

(assert (= (and b!152693 res!127980) b!152694))

(declare-fun m!238541 () Bool)

(assert (=> d!50190 m!238541))

(assert (=> d!50190 m!238521))

(assert (=> b!152672 d!50190))

(declare-fun d!50204 () Bool)

(assert (=> d!50204 (= (invariant!0 (currentBit!6550 bs1!10) (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10))) (and (bvsge (currentBit!6550 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6550 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6555 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10))) (and (= (currentBit!6550 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10)))))))))

(assert (=> b!152668 d!50204))

(declare-fun d!50210 () Bool)

(declare-fun e!102186 () Bool)

(assert (=> d!50210 e!102186))

(declare-fun res!127983 () Bool)

(assert (=> d!50210 (=> (not res!127983) (not e!102186))))

(declare-fun lt!239186 () (_ BitVec 64))

(declare-fun lt!239190 () (_ BitVec 64))

(declare-fun lt!239187 () (_ BitVec 64))

(assert (=> d!50210 (= res!127983 (= lt!239190 (bvsub lt!239187 lt!239186)))))

(assert (=> d!50210 (or (= (bvand lt!239187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239187 lt!239186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50210 (= lt!239186 (remainingBits!0 ((_ sign_extend 32) (size!3087 (buf!3590 bs2!18))) ((_ sign_extend 32) (currentByte!6555 bs2!18)) ((_ sign_extend 32) (currentBit!6550 bs2!18))))))

(declare-fun lt!239188 () (_ BitVec 64))

(declare-fun lt!239189 () (_ BitVec 64))

(assert (=> d!50210 (= lt!239187 (bvmul lt!239188 lt!239189))))

(assert (=> d!50210 (or (= lt!239188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239189 (bvsdiv (bvmul lt!239188 lt!239189) lt!239188)))))

(assert (=> d!50210 (= lt!239189 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50210 (= lt!239188 ((_ sign_extend 32) (size!3087 (buf!3590 bs2!18))))))

(assert (=> d!50210 (= lt!239190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6555 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6550 bs2!18))))))

(assert (=> d!50210 (invariant!0 (currentBit!6550 bs2!18) (currentByte!6555 bs2!18) (size!3087 (buf!3590 bs2!18)))))

(assert (=> d!50210 (= (bitIndex!0 (size!3087 (buf!3590 bs2!18)) (currentByte!6555 bs2!18) (currentBit!6550 bs2!18)) lt!239190)))

(declare-fun b!152695 () Bool)

(declare-fun res!127982 () Bool)

(assert (=> b!152695 (=> (not res!127982) (not e!102186))))

(assert (=> b!152695 (= res!127982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239190))))

(declare-fun b!152696 () Bool)

(declare-fun lt!239191 () (_ BitVec 64))

(assert (=> b!152696 (= e!102186 (bvsle lt!239190 (bvmul lt!239191 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152696 (or (= lt!239191 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239191 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239191)))))

(assert (=> b!152696 (= lt!239191 ((_ sign_extend 32) (size!3087 (buf!3590 bs2!18))))))

(assert (= (and d!50210 res!127983) b!152695))

(assert (= (and b!152695 res!127982) b!152696))

(declare-fun m!238545 () Bool)

(assert (=> d!50210 m!238545))

(declare-fun m!238547 () Bool)

(assert (=> d!50210 m!238547))

(assert (=> b!152669 d!50210))

(declare-fun d!50212 () Bool)

(assert (=> d!50212 (= (inv!12 bs1!10) (invariant!0 (currentBit!6550 bs1!10) (currentByte!6555 bs1!10) (size!3087 (buf!3590 bs1!10))))))

(declare-fun bs!12273 () Bool)

(assert (= bs!12273 d!50212))

(assert (=> bs!12273 m!238521))

(assert (=> start!29594 d!50212))

(declare-fun d!50214 () Bool)

(assert (=> d!50214 (= (inv!12 bs2!18) (invariant!0 (currentBit!6550 bs2!18) (currentByte!6555 bs2!18) (size!3087 (buf!3590 bs2!18))))))

(declare-fun bs!12274 () Bool)

(assert (= bs!12274 d!50214))

(assert (=> bs!12274 m!238547))

(assert (=> start!29594 d!50214))

(declare-fun d!50216 () Bool)

(assert (=> d!50216 (= (array_inv!2876 (buf!3590 bs2!18)) (bvsge (size!3087 (buf!3590 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152670 d!50216))

(push 1)

