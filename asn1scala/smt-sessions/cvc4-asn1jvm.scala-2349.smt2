; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59898 () Bool)

(assert start!59898)

(declare-fun res!227437 () Bool)

(declare-fun e!193133 () Bool)

(assert (=> start!59898 (=> (not res!227437) (not e!193133))))

(declare-datatypes ((array!15306 0))(
  ( (array!15307 (arr!7641 (Array (_ BitVec 32) (_ BitVec 8))) (size!6654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12122 0))(
  ( (BitStream!12123 (buf!7122 array!15306) (currentByte!13135 (_ BitVec 32)) (currentBit!13130 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12122)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12122 (_ BitVec 64)) Bool)

(assert (=> start!59898 (= res!227437 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59898 e!193133))

(declare-fun e!193135 () Bool)

(declare-fun inv!12 (BitStream!12122) Bool)

(assert (=> start!59898 (and (inv!12 thiss!890) e!193135)))

(assert (=> start!59898 true))

(declare-fun b!273247 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273247 (= e!193133 (not (invariant!0 (currentBit!13130 thiss!890) (currentByte!13135 thiss!890) (size!6654 (buf!7122 thiss!890)))))))

(declare-datatypes ((Unit!19275 0))(
  ( (Unit!19276) )
))
(declare-datatypes ((tuple2!22410 0))(
  ( (tuple2!22411 (_1!12237 Unit!19275) (_2!12237 BitStream!12122)) )
))
(declare-fun lt!411077 () tuple2!22410)

(declare-fun moveBitIndex!0 (BitStream!12122 (_ BitVec 64)) tuple2!22410)

(assert (=> b!273247 (= lt!411077 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273248 () Bool)

(declare-fun array_inv!6378 (array!15306) Bool)

(assert (=> b!273248 (= e!193135 (array_inv!6378 (buf!7122 thiss!890)))))

(assert (= (and start!59898 res!227437) b!273247))

(assert (= start!59898 b!273248))

(declare-fun m!406133 () Bool)

(assert (=> start!59898 m!406133))

(declare-fun m!406135 () Bool)

(assert (=> start!59898 m!406135))

(declare-fun m!406137 () Bool)

(assert (=> b!273247 m!406137))

(declare-fun m!406139 () Bool)

(assert (=> b!273247 m!406139))

(declare-fun m!406141 () Bool)

(assert (=> b!273248 m!406141))

(push 1)

(assert (not start!59898))

(assert (not b!273248))

(assert (not b!273247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93444 () Bool)

(declare-fun res!227443 () Bool)

(declare-fun e!193141 () Bool)

(assert (=> d!93444 (=> (not res!227443) (not e!193141))))

(assert (=> d!93444 (= res!227443 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6654 (buf!7122 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6654 (buf!7122 thiss!890)))))))))

(assert (=> d!93444 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193141)))

(declare-fun b!273256 () Bool)

(declare-fun lt!411083 () (_ BitVec 64))

(assert (=> b!273256 (= e!193141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411083) (bvsle lt!411083 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6654 (buf!7122 thiss!890)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273256 (= lt!411083 (bvadd (bitIndex!0 (size!6654 (buf!7122 thiss!890)) (currentByte!13135 thiss!890) (currentBit!13130 thiss!890)) diffInBits!18))))

(assert (= (and d!93444 res!227443) b!273256))

(declare-fun m!406145 () Bool)

(assert (=> b!273256 m!406145))

(assert (=> start!59898 d!93444))

(declare-fun d!93450 () Bool)

(assert (=> d!93450 (= (inv!12 thiss!890) (invariant!0 (currentBit!13130 thiss!890) (currentByte!13135 thiss!890) (size!6654 (buf!7122 thiss!890))))))

(declare-fun bs!23573 () Bool)

(assert (= bs!23573 d!93450))

(assert (=> bs!23573 m!406137))

(assert (=> start!59898 d!93450))

(declare-fun d!93452 () Bool)

(assert (=> d!93452 (= (array_inv!6378 (buf!7122 thiss!890)) (bvsge (size!6654 (buf!7122 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273248 d!93452))

(declare-fun d!93458 () Bool)

(assert (=> d!93458 (= (invariant!0 (currentBit!13130 thiss!890) (currentByte!13135 thiss!890) (size!6654 (buf!7122 thiss!890))) (and (bvsge (currentBit!13130 thiss!890) #b00000000000000000000000000000000) (bvslt (currentBit!13130 thiss!890) #b00000000000000000000000000001000) (bvsge (currentByte!13135 thiss!890) #b00000000000000000000000000000000) (or (bvslt (currentByte!13135 thiss!890) (size!6654 (buf!7122 thiss!890))) (and (= (currentBit!13130 thiss!890) #b00000000000000000000000000000000) (= (currentByte!13135 thiss!890) (size!6654 (buf!7122 thiss!890)))))))))

(assert (=> b!273247 d!93458))

(declare-fun d!93464 () Bool)

(declare-fun lt!411111 () (_ BitVec 32))

(assert (=> d!93464 (= lt!411111 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411116 () (_ BitVec 32))

(assert (=> d!93464 (= lt!411116 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193155 () Bool)

(assert (=> d!93464 e!193155))

(declare-fun res!227455 () Bool)

(assert (=> d!93464 (=> (not res!227455) (not e!193155))))

(assert (=> d!93464 (= res!227455 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19280 () Unit!19275)

(declare-fun Unit!19281 () Unit!19275)

(declare-fun Unit!19282 () Unit!19275)

(assert (=> d!93464 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13130 thiss!890) lt!411111) #b00000000000000000000000000000000) (tuple2!22411 Unit!19280 (BitStream!12123 (buf!7122 thiss!890) (bvsub (bvadd (currentByte!13135 thiss!890) lt!411116) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411111 (currentBit!13130 thiss!890)))) (ite (bvsge (bvadd (currentBit!13130 thiss!890) lt!411111) #b00000000000000000000000000001000) (tuple2!22411 Unit!19281 (BitStream!12123 (buf!7122 thiss!890) (bvadd (currentByte!13135 thiss!890) lt!411116 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13130 thiss!890) lt!411111) #b00000000000000000000000000001000))) (tuple2!22411 Unit!19282 (BitStream!12123 (buf!7122 thiss!890) (bvadd (currentByte!13135 thiss!890) lt!411116) (bvadd (currentBit!13130 thiss!890) lt!411111))))))))

(declare-fun b!273271 () Bool)

(declare-fun e!193156 () Bool)

(assert (=> b!273271 (= e!193155 e!193156)))

(declare-fun res!227458 () Bool)

(assert (=> b!273271 (=> (not res!227458) (not e!193156))))

(declare-fun lt!411114 () tuple2!22410)

(declare-fun lt!411119 () (_ BitVec 64))

(assert (=> b!273271 (= res!227458 (= (bvadd lt!411119 diffInBits!18) (bitIndex!0 (size!6654 (buf!7122 (_2!12237 lt!411114))) (currentByte!13135 (_2!12237 lt!411114)) (currentBit!13130 (_2!12237 lt!411114)))))))

(assert (=> b!273271 (or (not (= (bvand lt!411119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411119 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273271 (= lt!411119 (bitIndex!0 (size!6654 (buf!7122 thiss!890)) (currentByte!13135 thiss!890) (currentBit!13130 thiss!890)))))

(declare-fun lt!411113 () (_ BitVec 32))

(declare-fun lt!411121 () (_ BitVec 32))

(declare-fun Unit!19286 () Unit!19275)

(declare-fun Unit!19287 () Unit!19275)

(declare-fun Unit!19288 () Unit!19275)

(assert (=> b!273271 (= lt!411114 (ite (bvslt (bvadd (currentBit!13130 thiss!890) lt!411121) #b00000000000000000000000000000000) (tuple2!22411 Unit!19286 (BitStream!12123 (buf!7122 thiss!890) (bvsub (bvadd (currentByte!13135 thiss!890) lt!411113) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411121 (currentBit!13130 thiss!890)))) (ite (bvsge (bvadd (currentBit!13130 thiss!890) lt!411121) #b00000000000000000000000000001000) (tuple2!22411 Unit!19287 (BitStream!12123 (buf!7122 thiss!890) (bvadd (currentByte!13135 thiss!890) lt!411113 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13130 thiss!890) lt!411121) #b00000000000000000000000000001000))) (tuple2!22411 Unit!19288 (BitStream!12123 (buf!7122 thiss!890) (bvadd (currentByte!13135 thiss!890) lt!411113) (bvadd (currentBit!13130 thiss!890) lt!411121))))))))

(assert (=> b!273271 (= lt!411121 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273271 (= lt!411113 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273272 () Bool)

(assert (=> b!273272 (= e!193156 (and (= (size!6654 (buf!7122 thiss!890)) (size!6654 (buf!7122 (_2!12237 lt!411114)))) (= (buf!7122 thiss!890) (buf!7122 (_2!12237 lt!411114)))))))

(assert (= (and d!93464 res!227455) b!273271))

(assert (= (and b!273271 res!227458) b!273272))

(assert (=> d!93464 m!406133))

(declare-fun m!406151 () Bool)

(assert (=> b!273271 m!406151))

(assert (=> b!273271 m!406145))

(assert (=> b!273247 d!93464))

(push 1)

