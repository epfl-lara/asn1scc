; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18578 () Bool)

(assert start!18578)

(declare-fun b!92214 () Bool)

(declare-fun e!60626 () Bool)

(declare-datatypes ((array!4318 0))(
  ( (array!4319 (arr!2579 (Array (_ BitVec 32) (_ BitVec 8))) (size!1951 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3446 0))(
  ( (BitStream!3447 (buf!2332 array!4318) (currentByte!4646 (_ BitVec 32)) (currentBit!4641 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3446)

(assert (=> b!92214 (= e!60626 (and (bvsle ((_ sign_extend 32) (size!1951 (buf!2332 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4646 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4641 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1951 (buf!2332 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4646 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4641 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!76120 () Bool)

(assert (=> start!18578 (=> (not res!76120) (not e!60626))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18578 (= res!76120 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18578 e!60626))

(assert (=> start!18578 true))

(declare-fun e!60627 () Bool)

(declare-fun inv!12 (BitStream!3446) Bool)

(assert (=> start!18578 (and (inv!12 bitStream1!8) e!60627)))

(declare-fun bitStream2!8 () BitStream!3446)

(declare-fun e!60623 () Bool)

(assert (=> start!18578 (and (inv!12 bitStream2!8) e!60623)))

(declare-fun base!8 () BitStream!3446)

(declare-fun e!60621 () Bool)

(assert (=> start!18578 (and (inv!12 base!8) e!60621)))

(declare-fun b!92215 () Bool)

(declare-fun res!76123 () Bool)

(assert (=> b!92215 (=> (not res!76123) (not e!60626))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92215 (= res!76123 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8))) (bitIndex!0 (size!1951 (buf!2332 bitStream2!8)) (currentByte!4646 bitStream2!8) (currentBit!4641 bitStream2!8))))))

(declare-fun b!92216 () Bool)

(declare-fun res!76119 () Bool)

(assert (=> b!92216 (=> (not res!76119) (not e!60626))))

(declare-fun isPrefixOf!0 (BitStream!3446 BitStream!3446) Bool)

(assert (=> b!92216 (= res!76119 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92217 () Bool)

(declare-fun array_inv!1788 (array!4318) Bool)

(assert (=> b!92217 (= e!60627 (array_inv!1788 (buf!2332 bitStream1!8)))))

(declare-fun b!92218 () Bool)

(declare-fun res!76125 () Bool)

(assert (=> b!92218 (=> (not res!76125) (not e!60626))))

(assert (=> b!92218 (= res!76125 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92219 () Bool)

(assert (=> b!92219 (= e!60621 (array_inv!1788 (buf!2332 base!8)))))

(declare-fun b!92220 () Bool)

(assert (=> b!92220 (= e!60623 (array_inv!1788 (buf!2332 bitStream2!8)))))

(declare-fun b!92221 () Bool)

(declare-fun res!76124 () Bool)

(assert (=> b!92221 (=> (not res!76124) (not e!60626))))

(assert (=> b!92221 (= res!76124 (and (= (buf!2332 bitStream1!8) (buf!2332 bitStream2!8)) (= (buf!2332 bitStream1!8) (buf!2332 base!8))))))

(declare-fun b!92222 () Bool)

(declare-fun res!76122 () Bool)

(assert (=> b!92222 (=> (not res!76122) (not e!60626))))

(declare-datatypes ((List!829 0))(
  ( (Nil!826) (Cons!825 (h!944 Bool) (t!1579 List!829)) )
))
(declare-fun listBits!13 () List!829)

(declare-fun length!420 (List!829) Int)

(assert (=> b!92222 (= res!76122 (> (length!420 listBits!13) 0))))

(declare-fun b!92223 () Bool)

(declare-fun res!76126 () Bool)

(assert (=> b!92223 (=> (not res!76126) (not e!60626))))

(assert (=> b!92223 (= res!76126 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92224 () Bool)

(declare-fun res!76121 () Bool)

(assert (=> b!92224 (=> (not res!76121) (not e!60626))))

(assert (=> b!92224 (= res!76121 (bvslt (bitIndex!0 (size!1951 (buf!2332 base!8)) (currentByte!4646 base!8) (currentBit!4641 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18578 res!76120) b!92222))

(assert (= (and b!92222 res!76122) b!92216))

(assert (= (and b!92216 res!76119) b!92218))

(assert (= (and b!92218 res!76125) b!92223))

(assert (= (and b!92223 res!76126) b!92221))

(assert (= (and b!92221 res!76124) b!92224))

(assert (= (and b!92224 res!76121) b!92215))

(assert (= (and b!92215 res!76123) b!92214))

(assert (= start!18578 b!92217))

(assert (= start!18578 b!92220))

(assert (= start!18578 b!92219))

(declare-fun m!136227 () Bool)

(assert (=> b!92223 m!136227))

(declare-fun m!136229 () Bool)

(assert (=> b!92219 m!136229))

(declare-fun m!136231 () Bool)

(assert (=> b!92215 m!136231))

(declare-fun m!136233 () Bool)

(assert (=> b!92215 m!136233))

(declare-fun m!136235 () Bool)

(assert (=> start!18578 m!136235))

(declare-fun m!136237 () Bool)

(assert (=> start!18578 m!136237))

(declare-fun m!136239 () Bool)

(assert (=> start!18578 m!136239))

(declare-fun m!136241 () Bool)

(assert (=> b!92218 m!136241))

(declare-fun m!136243 () Bool)

(assert (=> b!92216 m!136243))

(declare-fun m!136245 () Bool)

(assert (=> b!92220 m!136245))

(declare-fun m!136247 () Bool)

(assert (=> b!92224 m!136247))

(declare-fun m!136249 () Bool)

(assert (=> b!92217 m!136249))

(declare-fun m!136251 () Bool)

(assert (=> b!92222 m!136251))

(push 1)

(assert (not b!92217))

(assert (not b!92222))

(assert (not b!92215))

(assert (not b!92224))

(assert (not b!92223))

(assert (not b!92216))

(assert (not b!92219))

(assert (not start!18578))

(assert (not b!92218))

(assert (not b!92220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28730 () Bool)

(assert (=> d!28730 (= (array_inv!1788 (buf!2332 base!8)) (bvsge (size!1951 (buf!2332 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92219 d!28730))

(declare-fun d!28732 () Bool)

(declare-fun e!60660 () Bool)

(assert (=> d!28732 e!60660))

(declare-fun res!76182 () Bool)

(assert (=> d!28732 (=> (not res!76182) (not e!60660))))

(declare-fun lt!138108 () (_ BitVec 64))

(declare-fun lt!138103 () (_ BitVec 64))

(declare-fun lt!138104 () (_ BitVec 64))

(assert (=> d!28732 (= res!76182 (= lt!138104 (bvsub lt!138108 lt!138103)))))

(assert (=> d!28732 (or (= (bvand lt!138108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138108 lt!138103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28732 (= lt!138103 (remainingBits!0 ((_ sign_extend 32) (size!1951 (buf!2332 base!8))) ((_ sign_extend 32) (currentByte!4646 base!8)) ((_ sign_extend 32) (currentBit!4641 base!8))))))

(declare-fun lt!138106 () (_ BitVec 64))

(declare-fun lt!138105 () (_ BitVec 64))

(assert (=> d!28732 (= lt!138108 (bvmul lt!138106 lt!138105))))

(assert (=> d!28732 (or (= lt!138106 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138105 (bvsdiv (bvmul lt!138106 lt!138105) lt!138106)))))

(assert (=> d!28732 (= lt!138105 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28732 (= lt!138106 ((_ sign_extend 32) (size!1951 (buf!2332 base!8))))))

(assert (=> d!28732 (= lt!138104 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4646 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4641 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28732 (invariant!0 (currentBit!4641 base!8) (currentByte!4646 base!8) (size!1951 (buf!2332 base!8)))))

(assert (=> d!28732 (= (bitIndex!0 (size!1951 (buf!2332 base!8)) (currentByte!4646 base!8) (currentBit!4641 base!8)) lt!138104)))

(declare-fun b!92279 () Bool)

(declare-fun res!76181 () Bool)

(assert (=> b!92279 (=> (not res!76181) (not e!60660))))

(assert (=> b!92279 (= res!76181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138104))))

(declare-fun b!92280 () Bool)

(declare-fun lt!138107 () (_ BitVec 64))

(assert (=> b!92280 (= e!60660 (bvsle lt!138104 (bvmul lt!138107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92280 (or (= lt!138107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138107)))))

(assert (=> b!92280 (= lt!138107 ((_ sign_extend 32) (size!1951 (buf!2332 base!8))))))

(assert (= (and d!28732 res!76182) b!92279))

(assert (= (and b!92279 res!76181) b!92280))

(declare-fun m!136293 () Bool)

(assert (=> d!28732 m!136293))

(declare-fun m!136295 () Bool)

(assert (=> d!28732 m!136295))

(assert (=> b!92224 d!28732))

(declare-fun d!28756 () Bool)

(declare-fun res!76191 () Bool)

(declare-fun e!60666 () Bool)

(assert (=> d!28756 (=> (not res!76191) (not e!60666))))

(assert (=> d!28756 (= res!76191 (= (size!1951 (buf!2332 bitStream2!8)) (size!1951 (buf!2332 base!8))))))

(assert (=> d!28756 (= (isPrefixOf!0 bitStream2!8 base!8) e!60666)))

(declare-fun b!92287 () Bool)

(declare-fun res!76189 () Bool)

(assert (=> b!92287 (=> (not res!76189) (not e!60666))))

(assert (=> b!92287 (= res!76189 (bvsle (bitIndex!0 (size!1951 (buf!2332 bitStream2!8)) (currentByte!4646 bitStream2!8) (currentBit!4641 bitStream2!8)) (bitIndex!0 (size!1951 (buf!2332 base!8)) (currentByte!4646 base!8) (currentBit!4641 base!8))))))

(declare-fun b!92288 () Bool)

(declare-fun e!60665 () Bool)

(assert (=> b!92288 (= e!60666 e!60665)))

(declare-fun res!76190 () Bool)

(assert (=> b!92288 (=> res!76190 e!60665)))

(assert (=> b!92288 (= res!76190 (= (size!1951 (buf!2332 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92289 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4318 array!4318 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92289 (= e!60665 (arrayBitRangesEq!0 (buf!2332 bitStream2!8) (buf!2332 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1951 (buf!2332 bitStream2!8)) (currentByte!4646 bitStream2!8) (currentBit!4641 bitStream2!8))))))

(assert (= (and d!28756 res!76191) b!92287))

(assert (= (and b!92287 res!76189) b!92288))

(assert (= (and b!92288 (not res!76190)) b!92289))

(assert (=> b!92287 m!136233))

(assert (=> b!92287 m!136247))

(assert (=> b!92289 m!136233))

(assert (=> b!92289 m!136233))

(declare-fun m!136297 () Bool)

(assert (=> b!92289 m!136297))

(assert (=> b!92218 d!28756))

(declare-fun d!28758 () Bool)

(declare-fun res!76194 () Bool)

(declare-fun e!60668 () Bool)

(assert (=> d!28758 (=> (not res!76194) (not e!60668))))

(assert (=> d!28758 (= res!76194 (= (size!1951 (buf!2332 bitStream1!8)) (size!1951 (buf!2332 bitStream2!8))))))

(assert (=> d!28758 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60668)))

(declare-fun b!92290 () Bool)

(declare-fun res!76192 () Bool)

(assert (=> b!92290 (=> (not res!76192) (not e!60668))))

(assert (=> b!92290 (= res!76192 (bvsle (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8)) (bitIndex!0 (size!1951 (buf!2332 bitStream2!8)) (currentByte!4646 bitStream2!8) (currentBit!4641 bitStream2!8))))))

(declare-fun b!92291 () Bool)

(declare-fun e!60667 () Bool)

(assert (=> b!92291 (= e!60668 e!60667)))

(declare-fun res!76193 () Bool)

(assert (=> b!92291 (=> res!76193 e!60667)))

(assert (=> b!92291 (= res!76193 (= (size!1951 (buf!2332 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92292 () Bool)

(assert (=> b!92292 (= e!60667 (arrayBitRangesEq!0 (buf!2332 bitStream1!8) (buf!2332 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8))))))

(assert (= (and d!28758 res!76194) b!92290))

(assert (= (and b!92290 res!76192) b!92291))

(assert (= (and b!92291 (not res!76193)) b!92292))

(assert (=> b!92290 m!136231))

(assert (=> b!92290 m!136233))

(assert (=> b!92292 m!136231))

(assert (=> b!92292 m!136231))

(declare-fun m!136299 () Bool)

(assert (=> b!92292 m!136299))

(assert (=> b!92223 d!28758))

(declare-fun d!28760 () Bool)

(assert (=> d!28760 (= (array_inv!1788 (buf!2332 bitStream1!8)) (bvsge (size!1951 (buf!2332 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92217 d!28760))

(declare-fun d!28762 () Bool)

(declare-fun size!1953 (List!829) Int)

(assert (=> d!28762 (= (length!420 listBits!13) (size!1953 listBits!13))))

(declare-fun bs!7087 () Bool)

(assert (= bs!7087 d!28762))

(declare-fun m!136301 () Bool)

(assert (=> bs!7087 m!136301))

(assert (=> b!92222 d!28762))

(declare-fun d!28764 () Bool)

(declare-fun res!76197 () Bool)

(declare-fun e!60670 () Bool)

(assert (=> d!28764 (=> (not res!76197) (not e!60670))))

(assert (=> d!28764 (= res!76197 (= (size!1951 (buf!2332 bitStream1!8)) (size!1951 (buf!2332 base!8))))))

(assert (=> d!28764 (= (isPrefixOf!0 bitStream1!8 base!8) e!60670)))

(declare-fun b!92293 () Bool)

(declare-fun res!76195 () Bool)

(assert (=> b!92293 (=> (not res!76195) (not e!60670))))

(assert (=> b!92293 (= res!76195 (bvsle (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8)) (bitIndex!0 (size!1951 (buf!2332 base!8)) (currentByte!4646 base!8) (currentBit!4641 base!8))))))

(declare-fun b!92294 () Bool)

(declare-fun e!60669 () Bool)

(assert (=> b!92294 (= e!60670 e!60669)))

(declare-fun res!76196 () Bool)

(assert (=> b!92294 (=> res!76196 e!60669)))

(assert (=> b!92294 (= res!76196 (= (size!1951 (buf!2332 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92295 () Bool)

(assert (=> b!92295 (= e!60669 (arrayBitRangesEq!0 (buf!2332 bitStream1!8) (buf!2332 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8))))))

(assert (= (and d!28764 res!76197) b!92293))

(assert (= (and b!92293 res!76195) b!92294))

(assert (= (and b!92294 (not res!76196)) b!92295))

(assert (=> b!92293 m!136231))

(assert (=> b!92293 m!136247))

(assert (=> b!92295 m!136231))

(assert (=> b!92295 m!136231))

(declare-fun m!136303 () Bool)

(assert (=> b!92295 m!136303))

(assert (=> b!92216 d!28764))

(declare-fun d!28766 () Bool)

(assert (=> d!28766 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4641 bitStream1!8) (currentByte!4646 bitStream1!8) (size!1951 (buf!2332 bitStream1!8))))))

(declare-fun bs!7088 () Bool)

(assert (= bs!7088 d!28766))

(declare-fun m!136305 () Bool)

(assert (=> bs!7088 m!136305))

(assert (=> start!18578 d!28766))

(declare-fun d!28768 () Bool)

(assert (=> d!28768 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4641 bitStream2!8) (currentByte!4646 bitStream2!8) (size!1951 (buf!2332 bitStream2!8))))))

(declare-fun bs!7089 () Bool)

(assert (= bs!7089 d!28768))

(declare-fun m!136307 () Bool)

(assert (=> bs!7089 m!136307))

(assert (=> start!18578 d!28768))

(declare-fun d!28770 () Bool)

(assert (=> d!28770 (= (inv!12 base!8) (invariant!0 (currentBit!4641 base!8) (currentByte!4646 base!8) (size!1951 (buf!2332 base!8))))))

(declare-fun bs!7090 () Bool)

(assert (= bs!7090 d!28770))

(assert (=> bs!7090 m!136295))

(assert (=> start!18578 d!28770))

(declare-fun d!28772 () Bool)

(declare-fun e!60671 () Bool)

(assert (=> d!28772 e!60671))

(declare-fun res!76199 () Bool)

(assert (=> d!28772 (=> (not res!76199) (not e!60671))))

(declare-fun lt!138110 () (_ BitVec 64))

(declare-fun lt!138114 () (_ BitVec 64))

(declare-fun lt!138109 () (_ BitVec 64))

(assert (=> d!28772 (= res!76199 (= lt!138110 (bvsub lt!138114 lt!138109)))))

(assert (=> d!28772 (or (= (bvand lt!138114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138114 lt!138109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28772 (= lt!138109 (remainingBits!0 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream1!8))) ((_ sign_extend 32) (currentByte!4646 bitStream1!8)) ((_ sign_extend 32) (currentBit!4641 bitStream1!8))))))

(declare-fun lt!138112 () (_ BitVec 64))

(declare-fun lt!138111 () (_ BitVec 64))

(assert (=> d!28772 (= lt!138114 (bvmul lt!138112 lt!138111))))

(assert (=> d!28772 (or (= lt!138112 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138111 (bvsdiv (bvmul lt!138112 lt!138111) lt!138112)))))

(assert (=> d!28772 (= lt!138111 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28772 (= lt!138112 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream1!8))))))

(assert (=> d!28772 (= lt!138110 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4646 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4641 bitStream1!8))))))

(assert (=> d!28772 (invariant!0 (currentBit!4641 bitStream1!8) (currentByte!4646 bitStream1!8) (size!1951 (buf!2332 bitStream1!8)))))

(assert (=> d!28772 (= (bitIndex!0 (size!1951 (buf!2332 bitStream1!8)) (currentByte!4646 bitStream1!8) (currentBit!4641 bitStream1!8)) lt!138110)))

(declare-fun b!92296 () Bool)

(declare-fun res!76198 () Bool)

(assert (=> b!92296 (=> (not res!76198) (not e!60671))))

(assert (=> b!92296 (= res!76198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138110))))

(declare-fun b!92297 () Bool)

(declare-fun lt!138113 () (_ BitVec 64))

(assert (=> b!92297 (= e!60671 (bvsle lt!138110 (bvmul lt!138113 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92297 (or (= lt!138113 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138113 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138113)))))

(assert (=> b!92297 (= lt!138113 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream1!8))))))

(assert (= (and d!28772 res!76199) b!92296))

(assert (= (and b!92296 res!76198) b!92297))

(declare-fun m!136309 () Bool)

(assert (=> d!28772 m!136309))

(assert (=> d!28772 m!136305))

(assert (=> b!92215 d!28772))

(declare-fun d!28774 () Bool)

(declare-fun e!60672 () Bool)

(assert (=> d!28774 e!60672))

(declare-fun res!76201 () Bool)

(assert (=> d!28774 (=> (not res!76201) (not e!60672))))

(declare-fun lt!138120 () (_ BitVec 64))

(declare-fun lt!138116 () (_ BitVec 64))

(declare-fun lt!138115 () (_ BitVec 64))

(assert (=> d!28774 (= res!76201 (= lt!138116 (bvsub lt!138120 lt!138115)))))

(assert (=> d!28774 (or (= (bvand lt!138120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138120 lt!138115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28774 (= lt!138115 (remainingBits!0 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream2!8))) ((_ sign_extend 32) (currentByte!4646 bitStream2!8)) ((_ sign_extend 32) (currentBit!4641 bitStream2!8))))))

(declare-fun lt!138118 () (_ BitVec 64))

(declare-fun lt!138117 () (_ BitVec 64))

(assert (=> d!28774 (= lt!138120 (bvmul lt!138118 lt!138117))))

(assert (=> d!28774 (or (= lt!138118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138117 (bvsdiv (bvmul lt!138118 lt!138117) lt!138118)))))

(assert (=> d!28774 (= lt!138117 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28774 (= lt!138118 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream2!8))))))

(assert (=> d!28774 (= lt!138116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4646 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4641 bitStream2!8))))))

(assert (=> d!28774 (invariant!0 (currentBit!4641 bitStream2!8) (currentByte!4646 bitStream2!8) (size!1951 (buf!2332 bitStream2!8)))))

(assert (=> d!28774 (= (bitIndex!0 (size!1951 (buf!2332 bitStream2!8)) (currentByte!4646 bitStream2!8) (currentBit!4641 bitStream2!8)) lt!138116)))

(declare-fun b!92298 () Bool)

(declare-fun res!76200 () Bool)

(assert (=> b!92298 (=> (not res!76200) (not e!60672))))

(assert (=> b!92298 (= res!76200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138116))))

(declare-fun b!92299 () Bool)

(declare-fun lt!138119 () (_ BitVec 64))

(assert (=> b!92299 (= e!60672 (bvsle lt!138116 (bvmul lt!138119 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92299 (or (= lt!138119 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138119 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138119)))))

(assert (=> b!92299 (= lt!138119 ((_ sign_extend 32) (size!1951 (buf!2332 bitStream2!8))))))

(assert (= (and d!28774 res!76201) b!92298))

(assert (= (and b!92298 res!76200) b!92299))

(declare-fun m!136311 () Bool)

(assert (=> d!28774 m!136311))

(assert (=> d!28774 m!136307))

(assert (=> b!92215 d!28774))

(declare-fun d!28776 () Bool)

(assert (=> d!28776 (= (array_inv!1788 (buf!2332 bitStream2!8)) (bvsge (size!1951 (buf!2332 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92220 d!28776))

(push 1)

(assert (not d!28772))

(assert (not d!28766))

(assert (not d!28774))

(assert (not b!92292))

(assert (not d!28732))

(assert (not b!92287))

(assert (not d!28770))

(assert (not d!28768))

(assert (not b!92293))

(assert (not b!92295))

(assert (not b!92290))

(assert (not d!28762))

(assert (not b!92289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

