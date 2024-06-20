; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49104 () Bool)

(assert start!49104)

(declare-fun b!233257 () Bool)

(declare-fun e!160706 () Bool)

(declare-datatypes ((array!12046 0))(
  ( (array!12047 (arr!6274 (Array (_ BitVec 32) (_ BitVec 8))) (size!5287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9670 0))(
  ( (BitStream!9671 (buf!5828 array!12046) (currentByte!10844 (_ BitVec 32)) (currentBit!10839 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9670)

(declare-fun array_inv!5028 (array!12046) Bool)

(assert (=> b!233257 (= e!160706 (array_inv!5028 (buf!5828 b1!101)))))

(declare-fun b!233258 () Bool)

(declare-fun e!160703 () Bool)

(declare-fun e!160701 () Bool)

(assert (=> b!233258 (= e!160703 e!160701)))

(declare-fun res!195149 () Bool)

(assert (=> b!233258 (=> (not res!195149) (not e!160701))))

(declare-fun lt!369229 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233258 (= res!195149 (bvsle lt!369229 bytes!19))))

(declare-fun lt!369231 () (_ BitVec 64))

(assert (=> b!233258 (= lt!369229 ((_ extract 31 0) lt!369231))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233258 (= lt!369231 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233259 () Bool)

(declare-fun res!195148 () Bool)

(assert (=> b!233259 (=> (not res!195148) (not e!160701))))

(declare-fun lt!369230 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233259 (= res!195148 (= lt!369230 (bvadd (bitIndex!0 (size!5287 (buf!5828 b1!101)) (currentByte!10844 b1!101) (currentBit!10839 b1!101)) bits!86)))))

(declare-fun res!195146 () Bool)

(declare-fun e!160702 () Bool)

(assert (=> start!49104 (=> (not res!195146) (not e!160702))))

(declare-fun b2!99 () BitStream!9670)

(assert (=> start!49104 (= res!195146 (and (= (size!5287 (buf!5828 b1!101)) (size!5287 (buf!5828 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49104 e!160702))

(declare-fun inv!12 (BitStream!9670) Bool)

(assert (=> start!49104 (and (inv!12 b1!101) e!160706)))

(declare-fun e!160700 () Bool)

(assert (=> start!49104 (and (inv!12 b2!99) e!160700)))

(assert (=> start!49104 true))

(declare-fun lt!369228 () (_ BitVec 64))

(declare-fun b!233260 () Bool)

(assert (=> b!233260 (= e!160701 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101)))) lt!369228) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14408 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10844 b2!99))) ((_ sign_extend 32) (currentBit!10839 b2!99))))) (and (= lt!369230 bdg!14408) (= (bvsub lt!369230 bits!86) lt!369228) (let ((bdg!14409 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5287 (buf!5828 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14409 (bvsub bdg!14408 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14409 bdg!14408) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369231)) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand lt!369229 #b10000000000000000000000000000000))) (not (= (bvand bytes!19 #b10000000000000000000000000000000) (bvand (bvsub bytes!19 lt!369229) #b10000000000000000000000000000000)))))))))))

(assert (=> b!233260 (= lt!369228 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10844 b1!101))) ((_ sign_extend 32) (currentBit!10839 b1!101))))))

(declare-fun b!233261 () Bool)

(declare-fun res!195150 () Bool)

(assert (=> b!233261 (=> (not res!195150) (not e!160701))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233261 (= res!195150 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233262 () Bool)

(assert (=> b!233262 (= e!160702 e!160703)))

(declare-fun res!195145 () Bool)

(assert (=> b!233262 (=> (not res!195145) (not e!160703))))

(assert (=> b!233262 (= res!195145 (bvsle bits!86 lt!369230))))

(assert (=> b!233262 (= lt!369230 (bitIndex!0 (size!5287 (buf!5828 b2!99)) (currentByte!10844 b2!99) (currentBit!10839 b2!99)))))

(declare-fun b!233263 () Bool)

(declare-fun res!195147 () Bool)

(assert (=> b!233263 (=> (not res!195147) (not e!160701))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233263 (= res!195147 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101)) bytes!19))))

(declare-fun b!233264 () Bool)

(assert (=> b!233264 (= e!160700 (array_inv!5028 (buf!5828 b2!99)))))

(assert (= (and start!49104 res!195146) b!233262))

(assert (= (and b!233262 res!195145) b!233258))

(assert (= (and b!233258 res!195149) b!233263))

(assert (= (and b!233263 res!195147) b!233259))

(assert (= (and b!233259 res!195148) b!233261))

(assert (= (and b!233261 res!195150) b!233260))

(assert (= start!49104 b!233257))

(assert (= start!49104 b!233264))

(declare-fun m!355925 () Bool)

(assert (=> b!233263 m!355925))

(declare-fun m!355927 () Bool)

(assert (=> b!233262 m!355927))

(declare-fun m!355929 () Bool)

(assert (=> b!233259 m!355929))

(declare-fun m!355931 () Bool)

(assert (=> b!233264 m!355931))

(declare-fun m!355933 () Bool)

(assert (=> b!233261 m!355933))

(declare-fun m!355935 () Bool)

(assert (=> b!233257 m!355935))

(declare-fun m!355937 () Bool)

(assert (=> start!49104 m!355937))

(declare-fun m!355939 () Bool)

(assert (=> start!49104 m!355939))

(push 1)

(assert (not start!49104))

(assert (not b!233263))

(assert (not b!233259))

(assert (not b!233261))

(assert (not b!233257))

(assert (not b!233262))

(assert (not b!233264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78588 () Bool)

(assert (=> d!78588 (= (array_inv!5028 (buf!5828 b1!101)) (bvsge (size!5287 (buf!5828 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233257 d!78588))

(declare-fun d!78590 () Bool)

(declare-fun e!160755 () Bool)

(assert (=> d!78590 e!160755))

(declare-fun res!195200 () Bool)

(assert (=> d!78590 (=> (not res!195200) (not e!160755))))

(declare-fun lt!369297 () (_ BitVec 64))

(declare-fun lt!369292 () (_ BitVec 64))

(declare-fun lt!369295 () (_ BitVec 64))

(assert (=> d!78590 (= res!195200 (= lt!369295 (bvsub lt!369297 lt!369292)))))

(assert (=> d!78590 (or (= (bvand lt!369297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369297 lt!369292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78590 (= lt!369292 (remainingBits!0 ((_ sign_extend 32) (size!5287 (buf!5828 b2!99))) ((_ sign_extend 32) (currentByte!10844 b2!99)) ((_ sign_extend 32) (currentBit!10839 b2!99))))))

(declare-fun lt!369296 () (_ BitVec 64))

(declare-fun lt!369294 () (_ BitVec 64))

(assert (=> d!78590 (= lt!369297 (bvmul lt!369296 lt!369294))))

(assert (=> d!78590 (or (= lt!369296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369294 (bvsdiv (bvmul lt!369296 lt!369294) lt!369296)))))

(assert (=> d!78590 (= lt!369294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78590 (= lt!369296 ((_ sign_extend 32) (size!5287 (buf!5828 b2!99))))))

(assert (=> d!78590 (= lt!369295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10844 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10839 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78590 (invariant!0 (currentBit!10839 b2!99) (currentByte!10844 b2!99) (size!5287 (buf!5828 b2!99)))))

(assert (=> d!78590 (= (bitIndex!0 (size!5287 (buf!5828 b2!99)) (currentByte!10844 b2!99) (currentBit!10839 b2!99)) lt!369295)))

(declare-fun b!233325 () Bool)

(declare-fun res!195199 () Bool)

(assert (=> b!233325 (=> (not res!195199) (not e!160755))))

(assert (=> b!233325 (= res!195199 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369295))))

(declare-fun b!233326 () Bool)

(declare-fun lt!369293 () (_ BitVec 64))

(assert (=> b!233326 (= e!160755 (bvsle lt!369295 (bvmul lt!369293 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233326 (or (= lt!369293 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369293 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369293)))))

(assert (=> b!233326 (= lt!369293 ((_ sign_extend 32) (size!5287 (buf!5828 b2!99))))))

(assert (= (and d!78590 res!195200) b!233325))

(assert (= (and b!233325 res!195199) b!233326))

(declare-fun m!355979 () Bool)

(assert (=> d!78590 m!355979))

(declare-fun m!355981 () Bool)

(assert (=> d!78590 m!355981))

(assert (=> b!233262 d!78590))

(declare-fun d!78592 () Bool)

(assert (=> d!78592 (= (remainingBits!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10844 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10839 b1!101)))))))

(assert (=> b!233261 d!78592))

(declare-fun d!78594 () Bool)

(declare-fun e!160756 () Bool)

(assert (=> d!78594 e!160756))

(declare-fun res!195202 () Bool)

(assert (=> d!78594 (=> (not res!195202) (not e!160756))))

(declare-fun lt!369298 () (_ BitVec 64))

(declare-fun lt!369301 () (_ BitVec 64))

(declare-fun lt!369303 () (_ BitVec 64))

(assert (=> d!78594 (= res!195202 (= lt!369301 (bvsub lt!369303 lt!369298)))))

(assert (=> d!78594 (or (= (bvand lt!369303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369303 lt!369298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78594 (= lt!369298 (remainingBits!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101))))))

(declare-fun lt!369302 () (_ BitVec 64))

(declare-fun lt!369300 () (_ BitVec 64))

(assert (=> d!78594 (= lt!369303 (bvmul lt!369302 lt!369300))))

(assert (=> d!78594 (or (= lt!369302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369300 (bvsdiv (bvmul lt!369302 lt!369300) lt!369302)))))

(assert (=> d!78594 (= lt!369300 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78594 (= lt!369302 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))))))

(assert (=> d!78594 (= lt!369301 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10844 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10839 b1!101))))))

(assert (=> d!78594 (invariant!0 (currentBit!10839 b1!101) (currentByte!10844 b1!101) (size!5287 (buf!5828 b1!101)))))

(assert (=> d!78594 (= (bitIndex!0 (size!5287 (buf!5828 b1!101)) (currentByte!10844 b1!101) (currentBit!10839 b1!101)) lt!369301)))

(declare-fun b!233327 () Bool)

(declare-fun res!195201 () Bool)

(assert (=> b!233327 (=> (not res!195201) (not e!160756))))

(assert (=> b!233327 (= res!195201 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369301))))

(declare-fun b!233328 () Bool)

(declare-fun lt!369299 () (_ BitVec 64))

(assert (=> b!233328 (= e!160756 (bvsle lt!369301 (bvmul lt!369299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233328 (or (= lt!369299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369299)))))

(assert (=> b!233328 (= lt!369299 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))))))

(assert (= (and d!78594 res!195202) b!233327))

(assert (= (and b!233327 res!195201) b!233328))

(assert (=> d!78594 m!355933))

(declare-fun m!355983 () Bool)

(assert (=> d!78594 m!355983))

(assert (=> b!233259 d!78594))

(declare-fun d!78596 () Bool)

(assert (=> d!78596 (= (inv!12 b1!101) (invariant!0 (currentBit!10839 b1!101) (currentByte!10844 b1!101) (size!5287 (buf!5828 b1!101))))))

(declare-fun bs!19360 () Bool)

(assert (= bs!19360 d!78596))

(assert (=> bs!19360 m!355983))

(assert (=> start!49104 d!78596))

(declare-fun d!78598 () Bool)

(assert (=> d!78598 (= (inv!12 b2!99) (invariant!0 (currentBit!10839 b2!99) (currentByte!10844 b2!99) (size!5287 (buf!5828 b2!99))))))

(declare-fun bs!19361 () Bool)

(assert (= bs!19361 d!78598))

(assert (=> bs!19361 m!355981))

(assert (=> start!49104 d!78598))

(declare-fun d!78600 () Bool)

(assert (=> d!78600 (= (array_inv!5028 (buf!5828 b2!99)) (bvsge (size!5287 (buf!5828 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233264 d!78600))

(declare-fun d!78602 () Bool)

(assert (=> d!78602 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5287 (buf!5828 b1!101))) ((_ sign_extend 32) (currentByte!10844 b1!101)) ((_ sign_extend 32) (currentBit!10839 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19362 () Bool)

(assert (= bs!19362 d!78602))

(assert (=> bs!19362 m!355933))

(assert (=> b!233263 d!78602))

(push 1)

(assert (not d!78590))

(assert (not d!78596))

(assert (not d!78602))

(assert (not d!78598))

(assert (not d!78594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

