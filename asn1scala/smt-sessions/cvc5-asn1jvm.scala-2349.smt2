; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59894 () Bool)

(assert start!59894)

(declare-fun res!227431 () Bool)

(declare-fun e!193115 () Bool)

(assert (=> start!59894 (=> (not res!227431) (not e!193115))))

(declare-datatypes ((array!15302 0))(
  ( (array!15303 (arr!7639 (Array (_ BitVec 32) (_ BitVec 8))) (size!6652 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12118 0))(
  ( (BitStream!12119 (buf!7120 array!15302) (currentByte!13133 (_ BitVec 32)) (currentBit!13128 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12118)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12118 (_ BitVec 64)) Bool)

(assert (=> start!59894 (= res!227431 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59894 e!193115))

(declare-fun e!193116 () Bool)

(declare-fun inv!12 (BitStream!12118) Bool)

(assert (=> start!59894 (and (inv!12 thiss!890) e!193116)))

(assert (=> start!59894 true))

(declare-fun b!273235 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273235 (= e!193115 (not (invariant!0 (currentBit!13128 thiss!890) (currentByte!13133 thiss!890) (size!6652 (buf!7120 thiss!890)))))))

(declare-datatypes ((Unit!19271 0))(
  ( (Unit!19272) )
))
(declare-datatypes ((tuple2!22406 0))(
  ( (tuple2!22407 (_1!12235 Unit!19271) (_2!12235 BitStream!12118)) )
))
(declare-fun lt!411071 () tuple2!22406)

(declare-fun moveBitIndex!0 (BitStream!12118 (_ BitVec 64)) tuple2!22406)

(assert (=> b!273235 (= lt!411071 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273236 () Bool)

(declare-fun array_inv!6376 (array!15302) Bool)

(assert (=> b!273236 (= e!193116 (array_inv!6376 (buf!7120 thiss!890)))))

(assert (= (and start!59894 res!227431) b!273235))

(assert (= start!59894 b!273236))

(declare-fun m!406113 () Bool)

(assert (=> start!59894 m!406113))

(declare-fun m!406115 () Bool)

(assert (=> start!59894 m!406115))

(declare-fun m!406117 () Bool)

(assert (=> b!273235 m!406117))

(declare-fun m!406119 () Bool)

(assert (=> b!273235 m!406119))

(declare-fun m!406121 () Bool)

(assert (=> b!273236 m!406121))

(push 1)

(assert (not start!59894))

(assert (not b!273236))

(assert (not b!273235))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93442 () Bool)

(declare-fun res!227442 () Bool)

(declare-fun e!193140 () Bool)

(assert (=> d!93442 (=> (not res!227442) (not e!193140))))

(assert (=> d!93442 (= res!227442 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6652 (buf!7120 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6652 (buf!7120 thiss!890)))))))))

(assert (=> d!93442 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193140)))

(declare-fun b!273255 () Bool)

(declare-fun lt!411082 () (_ BitVec 64))

(assert (=> b!273255 (= e!193140 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411082) (bvsle lt!411082 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6652 (buf!7120 thiss!890)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273255 (= lt!411082 (bvadd (bitIndex!0 (size!6652 (buf!7120 thiss!890)) (currentByte!13133 thiss!890) (currentBit!13128 thiss!890)) diffInBits!18))))

(assert (= (and d!93442 res!227442) b!273255))

(declare-fun m!406143 () Bool)

(assert (=> b!273255 m!406143))

(assert (=> start!59894 d!93442))

(declare-fun d!93448 () Bool)

(assert (=> d!93448 (= (inv!12 thiss!890) (invariant!0 (currentBit!13128 thiss!890) (currentByte!13133 thiss!890) (size!6652 (buf!7120 thiss!890))))))

(declare-fun bs!23572 () Bool)

(assert (= bs!23572 d!93448))

(assert (=> bs!23572 m!406117))

(assert (=> start!59894 d!93448))

(declare-fun d!93454 () Bool)

(assert (=> d!93454 (= (array_inv!6376 (buf!7120 thiss!890)) (bvsge (size!6652 (buf!7120 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273236 d!93454))

(declare-fun d!93460 () Bool)

(assert (=> d!93460 (= (invariant!0 (currentBit!13128 thiss!890) (currentByte!13133 thiss!890) (size!6652 (buf!7120 thiss!890))) (and (bvsge (currentBit!13128 thiss!890) #b00000000000000000000000000000000) (bvslt (currentBit!13128 thiss!890) #b00000000000000000000000000001000) (bvsge (currentByte!13133 thiss!890) #b00000000000000000000000000000000) (or (bvslt (currentByte!13133 thiss!890) (size!6652 (buf!7120 thiss!890))) (and (= (currentBit!13128 thiss!890) #b00000000000000000000000000000000) (= (currentByte!13133 thiss!890) (size!6652 (buf!7120 thiss!890)))))))))

(assert (=> b!273235 d!93460))

(declare-fun d!93462 () Bool)

(declare-fun lt!411117 () (_ BitVec 32))

(assert (=> d!93462 (= lt!411117 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411118 () (_ BitVec 32))

(assert (=> d!93462 (= lt!411118 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193154 () Bool)

(assert (=> d!93462 e!193154))

(declare-fun res!227457 () Bool)

(assert (=> d!93462 (=> (not res!227457) (not e!193154))))

(assert (=> d!93462 (= res!227457 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19277 () Unit!19271)

(declare-fun Unit!19278 () Unit!19271)

(declare-fun Unit!19279 () Unit!19271)

(assert (=> d!93462 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13128 thiss!890) lt!411117) #b00000000000000000000000000000000) (tuple2!22407 Unit!19277 (BitStream!12119 (buf!7120 thiss!890) (bvsub (bvadd (currentByte!13133 thiss!890) lt!411118) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411117 (currentBit!13128 thiss!890)))) (ite (bvsge (bvadd (currentBit!13128 thiss!890) lt!411117) #b00000000000000000000000000001000) (tuple2!22407 Unit!19278 (BitStream!12119 (buf!7120 thiss!890) (bvadd (currentByte!13133 thiss!890) lt!411118 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13128 thiss!890) lt!411117) #b00000000000000000000000000001000))) (tuple2!22407 Unit!19279 (BitStream!12119 (buf!7120 thiss!890) (bvadd (currentByte!13133 thiss!890) lt!411118) (bvadd (currentBit!13128 thiss!890) lt!411117))))))))

(declare-fun b!273269 () Bool)

(declare-fun e!193153 () Bool)

(assert (=> b!273269 (= e!193154 e!193153)))

(declare-fun res!227456 () Bool)

(assert (=> b!273269 (=> (not res!227456) (not e!193153))))

(declare-fun lt!411115 () (_ BitVec 64))

(declare-fun lt!411122 () tuple2!22406)

(assert (=> b!273269 (= res!227456 (= (bvadd lt!411115 diffInBits!18) (bitIndex!0 (size!6652 (buf!7120 (_2!12235 lt!411122))) (currentByte!13133 (_2!12235 lt!411122)) (currentBit!13128 (_2!12235 lt!411122)))))))

(assert (=> b!273269 (or (not (= (bvand lt!411115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411115 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273269 (= lt!411115 (bitIndex!0 (size!6652 (buf!7120 thiss!890)) (currentByte!13133 thiss!890) (currentBit!13128 thiss!890)))))

(declare-fun lt!411112 () (_ BitVec 32))

(declare-fun lt!411120 () (_ BitVec 32))

(declare-fun Unit!19283 () Unit!19271)

(declare-fun Unit!19284 () Unit!19271)

(declare-fun Unit!19285 () Unit!19271)

(assert (=> b!273269 (= lt!411122 (ite (bvslt (bvadd (currentBit!13128 thiss!890) lt!411112) #b00000000000000000000000000000000) (tuple2!22407 Unit!19283 (BitStream!12119 (buf!7120 thiss!890) (bvsub (bvadd (currentByte!13133 thiss!890) lt!411120) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411112 (currentBit!13128 thiss!890)))) (ite (bvsge (bvadd (currentBit!13128 thiss!890) lt!411112) #b00000000000000000000000000001000) (tuple2!22407 Unit!19284 (BitStream!12119 (buf!7120 thiss!890) (bvadd (currentByte!13133 thiss!890) lt!411120 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13128 thiss!890) lt!411112) #b00000000000000000000000000001000))) (tuple2!22407 Unit!19285 (BitStream!12119 (buf!7120 thiss!890) (bvadd (currentByte!13133 thiss!890) lt!411120) (bvadd (currentBit!13128 thiss!890) lt!411112))))))))

(assert (=> b!273269 (= lt!411112 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273269 (= lt!411120 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273270 () Bool)

(assert (=> b!273270 (= e!193153 (and (= (size!6652 (buf!7120 thiss!890)) (size!6652 (buf!7120 (_2!12235 lt!411122)))) (= (buf!7120 thiss!890) (buf!7120 (_2!12235 lt!411122)))))))

(assert (= (and d!93462 res!227457) b!273269))

(assert (= (and b!273269 res!227456) b!273270))

(assert (=> d!93462 m!406113))

(declare-fun m!406149 () Bool)

(assert (=> b!273269 m!406149))

(assert (=> b!273269 m!406143))

(assert (=> b!273235 d!93462))

(push 1)

(assert (not d!93448))

(assert (not d!93462))

(assert (not b!273269))

(assert (not b!273255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

