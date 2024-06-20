; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49140 () Bool)

(assert start!49140)

(declare-fun b!233359 () Bool)

(declare-fun res!195236 () Bool)

(declare-fun e!160789 () Bool)

(assert (=> b!233359 (=> (not res!195236) (not e!160789))))

(declare-datatypes ((array!12055 0))(
  ( (array!12056 (arr!6277 (Array (_ BitVec 32) (_ BitVec 8))) (size!5290 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9676 0))(
  ( (BitStream!9677 (buf!5831 array!12055) (currentByte!10856 (_ BitVec 32)) (currentBit!10851 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9676)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233359 (= res!195236 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101)) bytes!19))))

(declare-fun b!233360 () Bool)

(declare-fun e!160784 () Bool)

(declare-fun e!160788 () Bool)

(assert (=> b!233360 (= e!160784 e!160788)))

(declare-fun res!195231 () Bool)

(assert (=> b!233360 (=> (not res!195231) (not e!160788))))

(declare-fun lt!369342 () (_ BitVec 64))

(declare-fun lt!369340 () (_ BitVec 64))

(declare-fun lt!369344 () (_ BitVec 64))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233360 (= res!195231 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369342 (bvsub lt!369340 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369342 lt!369340) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369344))))))

(declare-fun b2!99 () BitStream!9676)

(assert (=> b!233360 (= lt!369342 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99)))))))

(declare-fun b!233361 () Bool)

(declare-fun res!195232 () Bool)

(assert (=> b!233361 (=> (not res!195232) (not e!160789))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233361 (= res!195232 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!195235 () Bool)

(declare-fun e!160785 () Bool)

(assert (=> start!49140 (=> (not res!195235) (not e!160785))))

(assert (=> start!49140 (= res!195235 (and (= (size!5290 (buf!5831 b1!101)) (size!5290 (buf!5831 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49140 e!160785))

(declare-fun e!160782 () Bool)

(declare-fun inv!12 (BitStream!9676) Bool)

(assert (=> start!49140 (and (inv!12 b1!101) e!160782)))

(declare-fun e!160790 () Bool)

(assert (=> start!49140 (and (inv!12 b2!99) e!160790)))

(assert (=> start!49140 true))

(declare-fun b!233362 () Bool)

(declare-fun e!160783 () Bool)

(assert (=> b!233362 (= e!160783 e!160789)))

(declare-fun res!195229 () Bool)

(assert (=> b!233362 (=> (not res!195229) (not e!160789))))

(declare-fun lt!369345 () (_ BitVec 32))

(assert (=> b!233362 (= res!195229 (bvsle lt!369345 bytes!19))))

(assert (=> b!233362 (= lt!369345 ((_ extract 31 0) lt!369344))))

(assert (=> b!233362 (= lt!369344 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233363 () Bool)

(declare-fun array_inv!5031 (array!12055) Bool)

(assert (=> b!233363 (= e!160790 (array_inv!5031 (buf!5831 b2!99)))))

(declare-fun b!233364 () Bool)

(declare-fun e!160781 () Bool)

(assert (=> b!233364 (= e!160789 e!160781)))

(declare-fun res!195234 () Bool)

(assert (=> b!233364 (=> (not res!195234) (not e!160781))))

(declare-fun lt!369343 () (_ BitVec 64))

(assert (=> b!233364 (= res!195234 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101)))) lt!369343) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233364 (= lt!369343 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10856 b1!101))) ((_ sign_extend 32) (currentBit!10851 b1!101))))))

(declare-fun b!233365 () Bool)

(declare-fun res!195230 () Bool)

(assert (=> b!233365 (=> (not res!195230) (not e!160789))))

(declare-fun lt!369341 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233365 (= res!195230 (= lt!369341 (bvadd (bitIndex!0 (size!5290 (buf!5831 b1!101)) (currentByte!10856 b1!101) (currentBit!10851 b1!101)) bits!86)))))

(declare-fun b!233366 () Bool)

(assert (=> b!233366 (= e!160785 e!160783)))

(declare-fun res!195233 () Bool)

(assert (=> b!233366 (=> (not res!195233) (not e!160783))))

(assert (=> b!233366 (= res!195233 (bvsle bits!86 lt!369341))))

(assert (=> b!233366 (= lt!369341 (bitIndex!0 (size!5290 (buf!5831 b2!99)) (currentByte!10856 b2!99) (currentBit!10851 b2!99)))))

(declare-fun b!233367 () Bool)

(assert (=> b!233367 (= e!160781 e!160784)))

(declare-fun res!195237 () Bool)

(assert (=> b!233367 (=> (not res!195237) (not e!160784))))

(assert (=> b!233367 (= res!195237 (and (= lt!369341 lt!369340) (= (bvsub lt!369341 bits!86) lt!369343)))))

(assert (=> b!233367 (= lt!369340 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10856 b2!99))) ((_ sign_extend 32) (currentBit!10851 b2!99))))))

(declare-fun b!233368 () Bool)

(assert (=> b!233368 (= e!160782 (array_inv!5031 (buf!5831 b1!101)))))

(declare-fun b!233369 () Bool)

(assert (=> b!233369 (= e!160788 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))) ((_ sign_extend 32) (currentByte!10856 b2!99)) ((_ sign_extend 32) (currentBit!10851 b2!99)) (bvsub bytes!19 lt!369345))))))

(assert (= (and start!49140 res!195235) b!233366))

(assert (= (and b!233366 res!195233) b!233362))

(assert (= (and b!233362 res!195229) b!233359))

(assert (= (and b!233359 res!195236) b!233365))

(assert (= (and b!233365 res!195230) b!233361))

(assert (= (and b!233361 res!195232) b!233364))

(assert (= (and b!233364 res!195234) b!233367))

(assert (= (and b!233367 res!195237) b!233360))

(assert (= (and b!233360 res!195231) b!233369))

(assert (= start!49140 b!233368))

(assert (= start!49140 b!233363))

(declare-fun m!355991 () Bool)

(assert (=> b!233359 m!355991))

(declare-fun m!355993 () Bool)

(assert (=> b!233361 m!355993))

(declare-fun m!355995 () Bool)

(assert (=> b!233363 m!355995))

(declare-fun m!355997 () Bool)

(assert (=> b!233366 m!355997))

(declare-fun m!355999 () Bool)

(assert (=> b!233365 m!355999))

(declare-fun m!356001 () Bool)

(assert (=> b!233368 m!356001))

(declare-fun m!356003 () Bool)

(assert (=> b!233369 m!356003))

(declare-fun m!356005 () Bool)

(assert (=> start!49140 m!356005))

(declare-fun m!356007 () Bool)

(assert (=> start!49140 m!356007))

(push 1)

(assert (not start!49140))

(assert (not b!233359))

(assert (not b!233368))

(assert (not b!233366))

(assert (not b!233361))

(assert (not b!233363))

(assert (not b!233369))

(assert (not b!233365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78658 () Bool)

(declare-fun e!160861 () Bool)

(assert (=> d!78658 e!160861))

(declare-fun res!195312 () Bool)

(assert (=> d!78658 (=> (not res!195312) (not e!160861))))

(declare-fun lt!369445 () (_ BitVec 64))

(declare-fun lt!369444 () (_ BitVec 64))

(declare-fun lt!369447 () (_ BitVec 64))

(assert (=> d!78658 (= res!195312 (= lt!369447 (bvsub lt!369445 lt!369444)))))

(assert (=> d!78658 (or (= (bvand lt!369445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369445 lt!369444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78658 (= lt!369444 (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101))))))

(declare-fun lt!369442 () (_ BitVec 64))

(declare-fun lt!369446 () (_ BitVec 64))

(assert (=> d!78658 (= lt!369445 (bvmul lt!369442 lt!369446))))

(assert (=> d!78658 (or (= lt!369442 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369446 (bvsdiv (bvmul lt!369442 lt!369446) lt!369442)))))

(assert (=> d!78658 (= lt!369446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78658 (= lt!369442 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))))))

(assert (=> d!78658 (= lt!369447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10856 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10851 b1!101))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78658 (invariant!0 (currentBit!10851 b1!101) (currentByte!10856 b1!101) (size!5290 (buf!5831 b1!101)))))

(assert (=> d!78658 (= (bitIndex!0 (size!5290 (buf!5831 b1!101)) (currentByte!10856 b1!101) (currentBit!10851 b1!101)) lt!369447)))

(declare-fun b!233456 () Bool)

(declare-fun res!195313 () Bool)

(assert (=> b!233456 (=> (not res!195313) (not e!160861))))

(assert (=> b!233456 (= res!195313 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369447))))

(declare-fun b!233457 () Bool)

(declare-fun lt!369443 () (_ BitVec 64))

(assert (=> b!233457 (= e!160861 (bvsle lt!369447 (bvmul lt!369443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233457 (or (= lt!369443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369443)))))

(assert (=> b!233457 (= lt!369443 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))))))

(assert (= (and d!78658 res!195312) b!233456))

(assert (= (and b!233456 res!195313) b!233457))

(assert (=> d!78658 m!355993))

(declare-fun m!356057 () Bool)

(assert (=> d!78658 m!356057))

(assert (=> b!233365 d!78658))

(declare-fun d!78660 () Bool)

(declare-fun e!160862 () Bool)

(assert (=> d!78660 e!160862))

(declare-fun res!195314 () Bool)

(assert (=> d!78660 (=> (not res!195314) (not e!160862))))

(declare-fun lt!369451 () (_ BitVec 64))

(declare-fun lt!369450 () (_ BitVec 64))

(declare-fun lt!369453 () (_ BitVec 64))

(assert (=> d!78660 (= res!195314 (= lt!369453 (bvsub lt!369451 lt!369450)))))

(assert (=> d!78660 (or (= (bvand lt!369451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!369450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!369451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!369451 lt!369450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78660 (= lt!369450 (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))) ((_ sign_extend 32) (currentByte!10856 b2!99)) ((_ sign_extend 32) (currentBit!10851 b2!99))))))

(declare-fun lt!369448 () (_ BitVec 64))

(declare-fun lt!369452 () (_ BitVec 64))

(assert (=> d!78660 (= lt!369451 (bvmul lt!369448 lt!369452))))

(assert (=> d!78660 (or (= lt!369448 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!369452 (bvsdiv (bvmul lt!369448 lt!369452) lt!369448)))))

(assert (=> d!78660 (= lt!369452 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78660 (= lt!369448 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))))))

(assert (=> d!78660 (= lt!369453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10856 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10851 b2!99))))))

(assert (=> d!78660 (invariant!0 (currentBit!10851 b2!99) (currentByte!10856 b2!99) (size!5290 (buf!5831 b2!99)))))

(assert (=> d!78660 (= (bitIndex!0 (size!5290 (buf!5831 b2!99)) (currentByte!10856 b2!99) (currentBit!10851 b2!99)) lt!369453)))

(declare-fun b!233458 () Bool)

(declare-fun res!195315 () Bool)

(assert (=> b!233458 (=> (not res!195315) (not e!160862))))

(assert (=> b!233458 (= res!195315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!369453))))

(declare-fun b!233459 () Bool)

(declare-fun lt!369449 () (_ BitVec 64))

(assert (=> b!233459 (= e!160862 (bvsle lt!369453 (bvmul lt!369449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233459 (or (= lt!369449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!369449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!369449)))))

(assert (=> b!233459 (= lt!369449 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))))))

(assert (= (and d!78660 res!195314) b!233458))

(assert (= (and b!233458 res!195315) b!233459))

(declare-fun m!356059 () Bool)

(assert (=> d!78660 m!356059))

(declare-fun m!356061 () Bool)

(assert (=> d!78660 m!356061))

(assert (=> b!233366 d!78660))

(declare-fun d!78662 () Bool)

(assert (=> d!78662 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))) ((_ sign_extend 32) (currentByte!10856 b2!99)) ((_ sign_extend 32) (currentBit!10851 b2!99)) (bvsub bytes!19 lt!369345)) (bvsle ((_ sign_extend 32) (bvsub bytes!19 lt!369345)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b2!99))) ((_ sign_extend 32) (currentByte!10856 b2!99)) ((_ sign_extend 32) (currentBit!10851 b2!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19377 () Bool)

(assert (= bs!19377 d!78662))

(assert (=> bs!19377 m!356059))

(assert (=> b!233369 d!78662))

(declare-fun d!78664 () Bool)

(assert (=> d!78664 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19378 () Bool)

(assert (= bs!19378 d!78664))

(assert (=> bs!19378 m!355993))

(assert (=> b!233359 d!78664))

(declare-fun d!78666 () Bool)

(assert (=> d!78666 (= (array_inv!5031 (buf!5831 b1!101)) (bvsge (size!5290 (buf!5831 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!233368 d!78666))

(declare-fun d!78668 () Bool)

(assert (=> d!78668 (= (inv!12 b1!101) (invariant!0 (currentBit!10851 b1!101) (currentByte!10856 b1!101) (size!5290 (buf!5831 b1!101))))))

(declare-fun bs!19379 () Bool)

(assert (= bs!19379 d!78668))

(assert (=> bs!19379 m!356057))

(assert (=> start!49140 d!78668))

(declare-fun d!78670 () Bool)

(assert (=> d!78670 (= (inv!12 b2!99) (invariant!0 (currentBit!10851 b2!99) (currentByte!10856 b2!99) (size!5290 (buf!5831 b2!99))))))

(declare-fun bs!19380 () Bool)

(assert (= bs!19380 d!78670))

(assert (=> bs!19380 m!356061))

(assert (=> start!49140 d!78670))

(declare-fun d!78672 () Bool)

(assert (=> d!78672 (= (array_inv!5031 (buf!5831 b2!99)) (bvsge (size!5290 (buf!5831 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!233363 d!78672))

(declare-fun d!78674 () Bool)

(assert (=> d!78674 (= (remainingBits!0 ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) ((_ sign_extend 32) (currentByte!10856 b1!101)) ((_ sign_extend 32) (currentBit!10851 b1!101))) (bvsub (bvmul ((_ sign_extend 32) (size!5290 (buf!5831 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10856 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10851 b1!101)))))))

(assert (=> b!233361 d!78674))

(push 1)

(assert (not d!78664))

(assert (not d!78670))

(assert (not d!78660))

(assert (not d!78658))

(assert (not d!78662))

(assert (not d!78668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

