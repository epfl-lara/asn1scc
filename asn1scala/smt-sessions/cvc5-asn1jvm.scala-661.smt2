; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18574 () Bool)

(assert start!18574)

(declare-fun b!92148 () Bool)

(declare-fun e!60584 () Bool)

(declare-datatypes ((array!4314 0))(
  ( (array!4315 (arr!2577 (Array (_ BitVec 32) (_ BitVec 8))) (size!1949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3442 0))(
  ( (BitStream!3443 (buf!2330 array!4314) (currentByte!4644 (_ BitVec 32)) (currentBit!4639 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3442)

(declare-fun array_inv!1786 (array!4314) Bool)

(assert (=> b!92148 (= e!60584 (array_inv!1786 (buf!2330 bitStream1!8)))))

(declare-fun b!92149 () Bool)

(declare-fun res!76074 () Bool)

(declare-fun e!60583 () Bool)

(assert (=> b!92149 (=> (not res!76074) (not e!60583))))

(declare-fun bitStream2!8 () BitStream!3442)

(declare-fun base!8 () BitStream!3442)

(assert (=> b!92149 (= res!76074 (and (= (buf!2330 bitStream1!8) (buf!2330 bitStream2!8)) (= (buf!2330 bitStream1!8) (buf!2330 base!8))))))

(declare-fun b!92150 () Bool)

(declare-fun e!60582 () Bool)

(assert (=> b!92150 (= e!60582 (array_inv!1786 (buf!2330 bitStream2!8)))))

(declare-fun res!76076 () Bool)

(assert (=> start!18574 (=> (not res!76076) (not e!60583))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18574 (= res!76076 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18574 e!60583))

(assert (=> start!18574 true))

(declare-fun inv!12 (BitStream!3442) Bool)

(assert (=> start!18574 (and (inv!12 bitStream1!8) e!60584)))

(assert (=> start!18574 (and (inv!12 bitStream2!8) e!60582)))

(declare-fun e!60579 () Bool)

(assert (=> start!18574 (and (inv!12 base!8) e!60579)))

(declare-fun b!92151 () Bool)

(declare-fun res!76072 () Bool)

(assert (=> b!92151 (=> (not res!76072) (not e!60583))))

(declare-fun isPrefixOf!0 (BitStream!3442 BitStream!3442) Bool)

(assert (=> b!92151 (= res!76072 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92152 () Bool)

(declare-fun res!76078 () Bool)

(assert (=> b!92152 (=> (not res!76078) (not e!60583))))

(declare-datatypes ((List!827 0))(
  ( (Nil!824) (Cons!823 (h!942 Bool) (t!1577 List!827)) )
))
(declare-fun listBits!13 () List!827)

(declare-fun length!418 (List!827) Int)

(assert (=> b!92152 (= res!76078 (> (length!418 listBits!13) 0))))

(declare-fun b!92153 () Bool)

(assert (=> b!92153 (= e!60579 (array_inv!1786 (buf!2330 base!8)))))

(declare-fun b!92154 () Bool)

(declare-fun res!76077 () Bool)

(assert (=> b!92154 (=> (not res!76077) (not e!60583))))

(assert (=> b!92154 (= res!76077 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92155 () Bool)

(declare-fun res!76071 () Bool)

(assert (=> b!92155 (=> (not res!76071) (not e!60583))))

(assert (=> b!92155 (= res!76071 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92156 () Bool)

(declare-fun res!76073 () Bool)

(assert (=> b!92156 (=> (not res!76073) (not e!60583))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92156 (= res!76073 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8))) (bitIndex!0 (size!1949 (buf!2330 bitStream2!8)) (currentByte!4644 bitStream2!8) (currentBit!4639 bitStream2!8))))))

(declare-fun b!92157 () Bool)

(declare-fun res!76075 () Bool)

(assert (=> b!92157 (=> (not res!76075) (not e!60583))))

(assert (=> b!92157 (= res!76075 (bvslt (bitIndex!0 (size!1949 (buf!2330 base!8)) (currentByte!4644 base!8) (currentBit!4639 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92158 () Bool)

(assert (=> b!92158 (= e!60583 (and (bvsle ((_ sign_extend 32) (size!1949 (buf!2330 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4644 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4639 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1949 (buf!2330 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4644 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4639 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!18574 res!76076) b!92152))

(assert (= (and b!92152 res!76078) b!92154))

(assert (= (and b!92154 res!76077) b!92151))

(assert (= (and b!92151 res!76072) b!92155))

(assert (= (and b!92155 res!76071) b!92149))

(assert (= (and b!92149 res!76074) b!92157))

(assert (= (and b!92157 res!76075) b!92156))

(assert (= (and b!92156 res!76073) b!92158))

(assert (= start!18574 b!92148))

(assert (= start!18574 b!92150))

(assert (= start!18574 b!92153))

(declare-fun m!136175 () Bool)

(assert (=> b!92151 m!136175))

(declare-fun m!136177 () Bool)

(assert (=> b!92154 m!136177))

(declare-fun m!136179 () Bool)

(assert (=> b!92153 m!136179))

(declare-fun m!136181 () Bool)

(assert (=> b!92150 m!136181))

(declare-fun m!136183 () Bool)

(assert (=> b!92157 m!136183))

(declare-fun m!136185 () Bool)

(assert (=> b!92156 m!136185))

(declare-fun m!136187 () Bool)

(assert (=> b!92156 m!136187))

(declare-fun m!136189 () Bool)

(assert (=> start!18574 m!136189))

(declare-fun m!136191 () Bool)

(assert (=> start!18574 m!136191))

(declare-fun m!136193 () Bool)

(assert (=> start!18574 m!136193))

(declare-fun m!136195 () Bool)

(assert (=> b!92152 m!136195))

(declare-fun m!136197 () Bool)

(assert (=> b!92148 m!136197))

(declare-fun m!136199 () Bool)

(assert (=> b!92155 m!136199))

(push 1)

(assert (not b!92156))

(assert (not b!92157))

(assert (not start!18574))

(assert (not b!92154))

(assert (not b!92152))

(assert (not b!92150))

(assert (not b!92151))

(assert (not b!92148))

(assert (not b!92153))

(assert (not b!92155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28706 () Bool)

(declare-fun e!60641 () Bool)

(assert (=> d!28706 e!60641))

(declare-fun res!76150 () Bool)

(assert (=> d!28706 (=> (not res!76150) (not e!60641))))

(declare-fun lt!138064 () (_ BitVec 64))

(declare-fun lt!138065 () (_ BitVec 64))

(declare-fun lt!138062 () (_ BitVec 64))

(assert (=> d!28706 (= res!76150 (= lt!138064 (bvsub lt!138065 lt!138062)))))

(assert (=> d!28706 (or (= (bvand lt!138065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138062 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138065 lt!138062) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28706 (= lt!138062 (remainingBits!0 ((_ sign_extend 32) (size!1949 (buf!2330 base!8))) ((_ sign_extend 32) (currentByte!4644 base!8)) ((_ sign_extend 32) (currentBit!4639 base!8))))))

(declare-fun lt!138061 () (_ BitVec 64))

(declare-fun lt!138063 () (_ BitVec 64))

(assert (=> d!28706 (= lt!138065 (bvmul lt!138061 lt!138063))))

(assert (=> d!28706 (or (= lt!138061 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138063 (bvsdiv (bvmul lt!138061 lt!138063) lt!138061)))))

(assert (=> d!28706 (= lt!138063 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28706 (= lt!138061 ((_ sign_extend 32) (size!1949 (buf!2330 base!8))))))

(assert (=> d!28706 (= lt!138064 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4644 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4639 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28706 (invariant!0 (currentBit!4639 base!8) (currentByte!4644 base!8) (size!1949 (buf!2330 base!8)))))

(assert (=> d!28706 (= (bitIndex!0 (size!1949 (buf!2330 base!8)) (currentByte!4644 base!8) (currentBit!4639 base!8)) lt!138064)))

(declare-fun b!92247 () Bool)

(declare-fun res!76149 () Bool)

(assert (=> b!92247 (=> (not res!76149) (not e!60641))))

(assert (=> b!92247 (= res!76149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138064))))

(declare-fun b!92248 () Bool)

(declare-fun lt!138066 () (_ BitVec 64))

(assert (=> b!92248 (= e!60641 (bvsle lt!138064 (bvmul lt!138066 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92248 (or (= lt!138066 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138066 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138066)))))

(assert (=> b!92248 (= lt!138066 ((_ sign_extend 32) (size!1949 (buf!2330 base!8))))))

(assert (= (and d!28706 res!76150) b!92247))

(assert (= (and b!92247 res!76149) b!92248))

(declare-fun m!136263 () Bool)

(assert (=> d!28706 m!136263))

(declare-fun m!136265 () Bool)

(assert (=> d!28706 m!136265))

(assert (=> b!92157 d!28706))

(declare-fun d!28714 () Bool)

(declare-fun res!76164 () Bool)

(declare-fun e!60650 () Bool)

(assert (=> d!28714 (=> (not res!76164) (not e!60650))))

(assert (=> d!28714 (= res!76164 (= (size!1949 (buf!2330 bitStream2!8)) (size!1949 (buf!2330 base!8))))))

(assert (=> d!28714 (= (isPrefixOf!0 bitStream2!8 base!8) e!60650)))

(declare-fun b!92262 () Bool)

(declare-fun res!76165 () Bool)

(assert (=> b!92262 (=> (not res!76165) (not e!60650))))

(assert (=> b!92262 (= res!76165 (bvsle (bitIndex!0 (size!1949 (buf!2330 bitStream2!8)) (currentByte!4644 bitStream2!8) (currentBit!4639 bitStream2!8)) (bitIndex!0 (size!1949 (buf!2330 base!8)) (currentByte!4644 base!8) (currentBit!4639 base!8))))))

(declare-fun b!92263 () Bool)

(declare-fun e!60651 () Bool)

(assert (=> b!92263 (= e!60650 e!60651)))

(declare-fun res!76166 () Bool)

(assert (=> b!92263 (=> res!76166 e!60651)))

(assert (=> b!92263 (= res!76166 (= (size!1949 (buf!2330 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92264 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4314 array!4314 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92264 (= e!60651 (arrayBitRangesEq!0 (buf!2330 bitStream2!8) (buf!2330 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1949 (buf!2330 bitStream2!8)) (currentByte!4644 bitStream2!8) (currentBit!4639 bitStream2!8))))))

(assert (= (and d!28714 res!76164) b!92262))

(assert (= (and b!92262 res!76165) b!92263))

(assert (= (and b!92263 (not res!76166)) b!92264))

(assert (=> b!92262 m!136187))

(assert (=> b!92262 m!136183))

(assert (=> b!92264 m!136187))

(assert (=> b!92264 m!136187))

(declare-fun m!136277 () Bool)

(assert (=> b!92264 m!136277))

(assert (=> b!92151 d!28714))

(declare-fun d!28734 () Bool)

(declare-fun e!60652 () Bool)

(assert (=> d!28734 e!60652))

(declare-fun res!76168 () Bool)

(assert (=> d!28734 (=> (not res!76168) (not e!60652))))

(declare-fun lt!138082 () (_ BitVec 64))

(declare-fun lt!138083 () (_ BitVec 64))

(declare-fun lt!138080 () (_ BitVec 64))

(assert (=> d!28734 (= res!76168 (= lt!138082 (bvsub lt!138083 lt!138080)))))

(assert (=> d!28734 (or (= (bvand lt!138083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138083 lt!138080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28734 (= lt!138080 (remainingBits!0 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream1!8))) ((_ sign_extend 32) (currentByte!4644 bitStream1!8)) ((_ sign_extend 32) (currentBit!4639 bitStream1!8))))))

(declare-fun lt!138079 () (_ BitVec 64))

(declare-fun lt!138081 () (_ BitVec 64))

(assert (=> d!28734 (= lt!138083 (bvmul lt!138079 lt!138081))))

(assert (=> d!28734 (or (= lt!138079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138081 (bvsdiv (bvmul lt!138079 lt!138081) lt!138079)))))

(assert (=> d!28734 (= lt!138081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28734 (= lt!138079 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream1!8))))))

(assert (=> d!28734 (= lt!138082 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4644 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4639 bitStream1!8))))))

(assert (=> d!28734 (invariant!0 (currentBit!4639 bitStream1!8) (currentByte!4644 bitStream1!8) (size!1949 (buf!2330 bitStream1!8)))))

(assert (=> d!28734 (= (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8)) lt!138082)))

(declare-fun b!92265 () Bool)

(declare-fun res!76167 () Bool)

(assert (=> b!92265 (=> (not res!76167) (not e!60652))))

(assert (=> b!92265 (= res!76167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138082))))

(declare-fun b!92266 () Bool)

(declare-fun lt!138084 () (_ BitVec 64))

(assert (=> b!92266 (= e!60652 (bvsle lt!138082 (bvmul lt!138084 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92266 (or (= lt!138084 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138084 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138084)))))

(assert (=> b!92266 (= lt!138084 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream1!8))))))

(assert (= (and d!28734 res!76168) b!92265))

(assert (= (and b!92265 res!76167) b!92266))

(declare-fun m!136279 () Bool)

(assert (=> d!28734 m!136279))

(declare-fun m!136281 () Bool)

(assert (=> d!28734 m!136281))

(assert (=> b!92156 d!28734))

(declare-fun d!28736 () Bool)

(declare-fun e!60653 () Bool)

(assert (=> d!28736 e!60653))

(declare-fun res!76170 () Bool)

(assert (=> d!28736 (=> (not res!76170) (not e!60653))))

(declare-fun lt!138088 () (_ BitVec 64))

(declare-fun lt!138089 () (_ BitVec 64))

(declare-fun lt!138086 () (_ BitVec 64))

(assert (=> d!28736 (= res!76170 (= lt!138088 (bvsub lt!138089 lt!138086)))))

(assert (=> d!28736 (or (= (bvand lt!138089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138089 lt!138086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28736 (= lt!138086 (remainingBits!0 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream2!8))) ((_ sign_extend 32) (currentByte!4644 bitStream2!8)) ((_ sign_extend 32) (currentBit!4639 bitStream2!8))))))

(declare-fun lt!138085 () (_ BitVec 64))

(declare-fun lt!138087 () (_ BitVec 64))

(assert (=> d!28736 (= lt!138089 (bvmul lt!138085 lt!138087))))

(assert (=> d!28736 (or (= lt!138085 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138087 (bvsdiv (bvmul lt!138085 lt!138087) lt!138085)))))

(assert (=> d!28736 (= lt!138087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28736 (= lt!138085 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream2!8))))))

(assert (=> d!28736 (= lt!138088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4644 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4639 bitStream2!8))))))

(assert (=> d!28736 (invariant!0 (currentBit!4639 bitStream2!8) (currentByte!4644 bitStream2!8) (size!1949 (buf!2330 bitStream2!8)))))

(assert (=> d!28736 (= (bitIndex!0 (size!1949 (buf!2330 bitStream2!8)) (currentByte!4644 bitStream2!8) (currentBit!4639 bitStream2!8)) lt!138088)))

(declare-fun b!92267 () Bool)

(declare-fun res!76169 () Bool)

(assert (=> b!92267 (=> (not res!76169) (not e!60653))))

(assert (=> b!92267 (= res!76169 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138088))))

(declare-fun b!92268 () Bool)

(declare-fun lt!138090 () (_ BitVec 64))

(assert (=> b!92268 (= e!60653 (bvsle lt!138088 (bvmul lt!138090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92268 (or (= lt!138090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138090)))))

(assert (=> b!92268 (= lt!138090 ((_ sign_extend 32) (size!1949 (buf!2330 bitStream2!8))))))

(assert (= (and d!28736 res!76170) b!92267))

(assert (= (and b!92267 res!76169) b!92268))

(declare-fun m!136283 () Bool)

(assert (=> d!28736 m!136283))

(declare-fun m!136285 () Bool)

(assert (=> d!28736 m!136285))

(assert (=> b!92156 d!28736))

(declare-fun d!28738 () Bool)

(assert (=> d!28738 (= (array_inv!1786 (buf!2330 bitStream2!8)) (bvsge (size!1949 (buf!2330 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92150 d!28738))

(declare-fun d!28740 () Bool)

(declare-fun res!76171 () Bool)

(declare-fun e!60654 () Bool)

(assert (=> d!28740 (=> (not res!76171) (not e!60654))))

(assert (=> d!28740 (= res!76171 (= (size!1949 (buf!2330 bitStream1!8)) (size!1949 (buf!2330 bitStream2!8))))))

(assert (=> d!28740 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60654)))

(declare-fun b!92269 () Bool)

(declare-fun res!76172 () Bool)

(assert (=> b!92269 (=> (not res!76172) (not e!60654))))

(assert (=> b!92269 (= res!76172 (bvsle (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8)) (bitIndex!0 (size!1949 (buf!2330 bitStream2!8)) (currentByte!4644 bitStream2!8) (currentBit!4639 bitStream2!8))))))

(declare-fun b!92270 () Bool)

(declare-fun e!60655 () Bool)

(assert (=> b!92270 (= e!60654 e!60655)))

(declare-fun res!76173 () Bool)

(assert (=> b!92270 (=> res!76173 e!60655)))

(assert (=> b!92270 (= res!76173 (= (size!1949 (buf!2330 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92271 () Bool)

(assert (=> b!92271 (= e!60655 (arrayBitRangesEq!0 (buf!2330 bitStream1!8) (buf!2330 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8))))))

(assert (= (and d!28740 res!76171) b!92269))

(assert (= (and b!92269 res!76172) b!92270))

(assert (= (and b!92270 (not res!76173)) b!92271))

(assert (=> b!92269 m!136185))

(assert (=> b!92269 m!136187))

(assert (=> b!92271 m!136185))

(assert (=> b!92271 m!136185))

(declare-fun m!136287 () Bool)

(assert (=> b!92271 m!136287))

(assert (=> b!92155 d!28740))

(declare-fun d!28742 () Bool)

(assert (=> d!28742 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4639 bitStream1!8) (currentByte!4644 bitStream1!8) (size!1949 (buf!2330 bitStream1!8))))))

(declare-fun bs!7083 () Bool)

(assert (= bs!7083 d!28742))

(assert (=> bs!7083 m!136281))

(assert (=> start!18574 d!28742))

(declare-fun d!28744 () Bool)

(assert (=> d!28744 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4639 bitStream2!8) (currentByte!4644 bitStream2!8) (size!1949 (buf!2330 bitStream2!8))))))

(declare-fun bs!7084 () Bool)

(assert (= bs!7084 d!28744))

(assert (=> bs!7084 m!136285))

(assert (=> start!18574 d!28744))

(declare-fun d!28746 () Bool)

(assert (=> d!28746 (= (inv!12 base!8) (invariant!0 (currentBit!4639 base!8) (currentByte!4644 base!8) (size!1949 (buf!2330 base!8))))))

(declare-fun bs!7085 () Bool)

(assert (= bs!7085 d!28746))

(assert (=> bs!7085 m!136265))

(assert (=> start!18574 d!28746))

(declare-fun d!28748 () Bool)

(declare-fun res!76174 () Bool)

(declare-fun e!60656 () Bool)

(assert (=> d!28748 (=> (not res!76174) (not e!60656))))

(assert (=> d!28748 (= res!76174 (= (size!1949 (buf!2330 bitStream1!8)) (size!1949 (buf!2330 base!8))))))

(assert (=> d!28748 (= (isPrefixOf!0 bitStream1!8 base!8) e!60656)))

(declare-fun b!92272 () Bool)

(declare-fun res!76175 () Bool)

(assert (=> b!92272 (=> (not res!76175) (not e!60656))))

(assert (=> b!92272 (= res!76175 (bvsle (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8)) (bitIndex!0 (size!1949 (buf!2330 base!8)) (currentByte!4644 base!8) (currentBit!4639 base!8))))))

(declare-fun b!92273 () Bool)

(declare-fun e!60657 () Bool)

(assert (=> b!92273 (= e!60656 e!60657)))

(declare-fun res!76176 () Bool)

(assert (=> b!92273 (=> res!76176 e!60657)))

(assert (=> b!92273 (= res!76176 (= (size!1949 (buf!2330 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92274 () Bool)

(assert (=> b!92274 (= e!60657 (arrayBitRangesEq!0 (buf!2330 bitStream1!8) (buf!2330 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1949 (buf!2330 bitStream1!8)) (currentByte!4644 bitStream1!8) (currentBit!4639 bitStream1!8))))))

(assert (= (and d!28748 res!76174) b!92272))

(assert (= (and b!92272 res!76175) b!92273))

(assert (= (and b!92273 (not res!76176)) b!92274))

(assert (=> b!92272 m!136185))

(assert (=> b!92272 m!136183))

(assert (=> b!92274 m!136185))

(assert (=> b!92274 m!136185))

(declare-fun m!136289 () Bool)

(assert (=> b!92274 m!136289))

(assert (=> b!92154 d!28748))

(declare-fun d!28750 () Bool)

(assert (=> d!28750 (= (array_inv!1786 (buf!2330 bitStream1!8)) (bvsge (size!1949 (buf!2330 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92148 d!28750))

(declare-fun d!28752 () Bool)

(assert (=> d!28752 (= (array_inv!1786 (buf!2330 base!8)) (bvsge (size!1949 (buf!2330 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92153 d!28752))

(declare-fun d!28754 () Bool)

(declare-fun size!1954 (List!827) Int)

(assert (=> d!28754 (= (length!418 listBits!13) (size!1954 listBits!13))))

(declare-fun bs!7086 () Bool)

(assert (= bs!7086 d!28754))

(declare-fun m!136291 () Bool)

(assert (=> bs!7086 m!136291))

(assert (=> b!92152 d!28754))

(push 1)

(assert (not b!92274))

(assert (not b!92272))

(assert (not b!92264))

(assert (not d!28742))

(assert (not d!28736))

(assert (not d!28746))

(assert (not b!92269))

(assert (not d!28734))

(assert (not b!92271))

(assert (not d!28706))

(assert (not b!92262))

(assert (not d!28754))

(assert (not d!28744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

