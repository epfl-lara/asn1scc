; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29590 () Bool)

(assert start!29590)

(declare-fun res!127939 () Bool)

(declare-fun e!102138 () Bool)

(assert (=> start!29590 (=> (not res!127939) (not e!102138))))

(declare-datatypes ((array!6830 0))(
  ( (array!6831 (arr!3908 (Array (_ BitVec 32) (_ BitVec 8))) (size!3085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5428 0))(
  ( (BitStream!5429 (buf!3588 array!6830) (currentByte!6553 (_ BitVec 32)) (currentBit!6548 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5428)

(declare-fun bs2!18 () BitStream!5428)

(assert (=> start!29590 (= res!127939 (= (size!3085 (buf!3588 bs1!10)) (size!3085 (buf!3588 bs2!18))))))

(assert (=> start!29590 e!102138))

(declare-fun e!102133 () Bool)

(declare-fun inv!12 (BitStream!5428) Bool)

(assert (=> start!29590 (and (inv!12 bs1!10) e!102133)))

(declare-fun e!102137 () Bool)

(assert (=> start!29590 (and (inv!12 bs2!18) e!102137)))

(declare-fun b!152638 () Bool)

(declare-fun array_inv!2874 (array!6830) Bool)

(assert (=> b!152638 (= e!102133 (array_inv!2874 (buf!3588 bs1!10)))))

(declare-fun b!152639 () Bool)

(declare-fun e!102135 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152639 (= e!102135 (not (invariant!0 (currentBit!6548 bs1!10) (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10)))))))

(declare-fun b!152640 () Bool)

(declare-fun res!127940 () Bool)

(assert (=> b!152640 (=> (not res!127940) (not e!102135))))

(declare-fun lt!239113 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152640 (= res!127940 (bvsle lt!239113 (bitIndex!0 (size!3085 (buf!3588 bs2!18)) (currentByte!6553 bs2!18) (currentBit!6548 bs2!18))))))

(declare-fun b!152641 () Bool)

(assert (=> b!152641 (= e!102138 e!102135)))

(declare-fun res!127941 () Bool)

(assert (=> b!152641 (=> (not res!127941) (not e!102135))))

(assert (=> b!152641 (= res!127941 (bvsle lt!239113 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3085 (buf!3588 bs1!10))))))))

(assert (=> b!152641 (= lt!239113 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3085 (buf!3588 bs1!10)) (currentByte!6553 bs1!10) (currentBit!6548 bs1!10))))))

(declare-fun b!152642 () Bool)

(assert (=> b!152642 (= e!102137 (array_inv!2874 (buf!3588 bs2!18)))))

(assert (= (and start!29590 res!127939) b!152641))

(assert (= (and b!152641 res!127941) b!152640))

(assert (= (and b!152640 res!127940) b!152639))

(assert (= start!29590 b!152638))

(assert (= start!29590 b!152642))

(declare-fun m!238489 () Bool)

(assert (=> start!29590 m!238489))

(declare-fun m!238491 () Bool)

(assert (=> start!29590 m!238491))

(declare-fun m!238493 () Bool)

(assert (=> b!152640 m!238493))

(declare-fun m!238495 () Bool)

(assert (=> b!152639 m!238495))

(declare-fun m!238497 () Bool)

(assert (=> b!152641 m!238497))

(declare-fun m!238499 () Bool)

(assert (=> b!152638 m!238499))

(declare-fun m!238501 () Bool)

(assert (=> b!152642 m!238501))

(push 1)

(assert (not start!29590))

(assert (not b!152642))

(assert (not b!152639))

(assert (not b!152638))

(assert (not b!152640))

(assert (not b!152641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50178 () Bool)

(assert (=> d!50178 (= (invariant!0 (currentBit!6548 bs1!10) (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10))) (and (bvsge (currentBit!6548 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6548 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6553 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10))) (and (= (currentBit!6548 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10)))))))))

(assert (=> b!152639 d!50178))

(declare-fun d!50180 () Bool)

(assert (=> d!50180 (= (inv!12 bs1!10) (invariant!0 (currentBit!6548 bs1!10) (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10))))))

(declare-fun bs!12269 () Bool)

(assert (= bs!12269 d!50180))

(assert (=> bs!12269 m!238495))

(assert (=> start!29590 d!50180))

(declare-fun d!50182 () Bool)

(assert (=> d!50182 (= (inv!12 bs2!18) (invariant!0 (currentBit!6548 bs2!18) (currentByte!6553 bs2!18) (size!3085 (buf!3588 bs2!18))))))

(declare-fun bs!12270 () Bool)

(assert (= bs!12270 d!50182))

(declare-fun m!238531 () Bool)

(assert (=> bs!12270 m!238531))

(assert (=> start!29590 d!50182))

(declare-fun d!50184 () Bool)

(declare-fun e!102183 () Bool)

(assert (=> d!50184 e!102183))

(declare-fun res!127976 () Bool)

(assert (=> d!50184 (=> (not res!127976) (not e!102183))))

(declare-fun lt!239173 () (_ BitVec 64))

(declare-fun lt!239168 () (_ BitVec 64))

(declare-fun lt!239169 () (_ BitVec 64))

(assert (=> d!50184 (= res!127976 (= lt!239169 (bvsub lt!239168 lt!239173)))))

(assert (=> d!50184 (or (= (bvand lt!239168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239173 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239168 lt!239173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50184 (= lt!239173 (remainingBits!0 ((_ sign_extend 32) (size!3085 (buf!3588 bs2!18))) ((_ sign_extend 32) (currentByte!6553 bs2!18)) ((_ sign_extend 32) (currentBit!6548 bs2!18))))))

(declare-fun lt!239170 () (_ BitVec 64))

(declare-fun lt!239172 () (_ BitVec 64))

(assert (=> d!50184 (= lt!239168 (bvmul lt!239170 lt!239172))))

(assert (=> d!50184 (or (= lt!239170 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239172 (bvsdiv (bvmul lt!239170 lt!239172) lt!239170)))))

(assert (=> d!50184 (= lt!239172 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50184 (= lt!239170 ((_ sign_extend 32) (size!3085 (buf!3588 bs2!18))))))

(assert (=> d!50184 (= lt!239169 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6553 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6548 bs2!18))))))

(assert (=> d!50184 (invariant!0 (currentBit!6548 bs2!18) (currentByte!6553 bs2!18) (size!3085 (buf!3588 bs2!18)))))

(assert (=> d!50184 (= (bitIndex!0 (size!3085 (buf!3588 bs2!18)) (currentByte!6553 bs2!18) (currentBit!6548 bs2!18)) lt!239169)))

(declare-fun b!152689 () Bool)

(declare-fun res!127977 () Bool)

(assert (=> b!152689 (=> (not res!127977) (not e!102183))))

(assert (=> b!152689 (= res!127977 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239169))))

(declare-fun b!152690 () Bool)

(declare-fun lt!239171 () (_ BitVec 64))

(assert (=> b!152690 (= e!102183 (bvsle lt!239169 (bvmul lt!239171 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152690 (or (= lt!239171 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239171 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239171)))))

(assert (=> b!152690 (= lt!239171 ((_ sign_extend 32) (size!3085 (buf!3588 bs2!18))))))

(assert (= (and d!50184 res!127976) b!152689))

(assert (= (and b!152689 res!127977) b!152690))

(declare-fun m!238539 () Bool)

(assert (=> d!50184 m!238539))

(assert (=> d!50184 m!238531))

(assert (=> b!152640 d!50184))

(declare-fun d!50202 () Bool)

(declare-fun e!102184 () Bool)

(assert (=> d!50202 e!102184))

(declare-fun res!127978 () Bool)

(assert (=> d!50202 (=> (not res!127978) (not e!102184))))

(declare-fun lt!239179 () (_ BitVec 64))

(declare-fun lt!239175 () (_ BitVec 64))

(declare-fun lt!239174 () (_ BitVec 64))

(assert (=> d!50202 (= res!127978 (= lt!239175 (bvsub lt!239174 lt!239179)))))

(assert (=> d!50202 (or (= (bvand lt!239174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239179 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239174 lt!239179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50202 (= lt!239179 (remainingBits!0 ((_ sign_extend 32) (size!3085 (buf!3588 bs1!10))) ((_ sign_extend 32) (currentByte!6553 bs1!10)) ((_ sign_extend 32) (currentBit!6548 bs1!10))))))

(declare-fun lt!239176 () (_ BitVec 64))

(declare-fun lt!239178 () (_ BitVec 64))

(assert (=> d!50202 (= lt!239174 (bvmul lt!239176 lt!239178))))

(assert (=> d!50202 (or (= lt!239176 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239178 (bvsdiv (bvmul lt!239176 lt!239178) lt!239176)))))

(assert (=> d!50202 (= lt!239178 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50202 (= lt!239176 ((_ sign_extend 32) (size!3085 (buf!3588 bs1!10))))))

(assert (=> d!50202 (= lt!239175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6553 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6548 bs1!10))))))

(assert (=> d!50202 (invariant!0 (currentBit!6548 bs1!10) (currentByte!6553 bs1!10) (size!3085 (buf!3588 bs1!10)))))

(assert (=> d!50202 (= (bitIndex!0 (size!3085 (buf!3588 bs1!10)) (currentByte!6553 bs1!10) (currentBit!6548 bs1!10)) lt!239175)))

(declare-fun b!152691 () Bool)

(declare-fun res!127979 () Bool)

(assert (=> b!152691 (=> (not res!127979) (not e!102184))))

(assert (=> b!152691 (= res!127979 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239175))))

(declare-fun b!152692 () Bool)

(declare-fun lt!239177 () (_ BitVec 64))

(assert (=> b!152692 (= e!102184 (bvsle lt!239175 (bvmul lt!239177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152692 (or (= lt!239177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239177)))))

(assert (=> b!152692 (= lt!239177 ((_ sign_extend 32) (size!3085 (buf!3588 bs1!10))))))

(assert (= (and d!50202 res!127978) b!152691))

(assert (= (and b!152691 res!127979) b!152692))

(declare-fun m!238543 () Bool)

(assert (=> d!50202 m!238543))

(assert (=> d!50202 m!238495))

(assert (=> b!152641 d!50202))

(declare-fun d!50206 () Bool)

(assert (=> d!50206 (= (array_inv!2874 (buf!3588 bs2!18)) (bvsge (size!3085 (buf!3588 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152642 d!50206))

(declare-fun d!50208 () Bool)

(assert (=> d!50208 (= (array_inv!2874 (buf!3588 bs1!10)) (bvsge (size!3085 (buf!3588 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152638 d!50208))

(push 1)

(assert (not d!50182))

(assert (not d!50202))

(assert (not d!50180))

(assert (not d!50184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

