; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56020 () Bool)

(assert start!56020)

(declare-fun b!260143 () Bool)

(declare-fun e!180551 () Bool)

(declare-fun e!180553 () Bool)

(assert (=> b!260143 (= e!180551 e!180553)))

(declare-fun res!217849 () Bool)

(assert (=> b!260143 (=> (not res!217849) (not e!180553))))

(declare-datatypes ((array!14232 0))(
  ( (array!14233 (arr!7216 (Array (_ BitVec 32) (_ BitVec 8))) (size!6229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11380 0))(
  ( (BitStream!11381 (buf!6751 array!14232) (currentByte!12419 (_ BitVec 32)) (currentBit!12414 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22310 0))(
  ( (tuple2!22311 (_1!12091 Bool) (_2!12091 BitStream!11380)) )
))
(declare-fun lt!402378 () tuple2!22310)

(declare-fun expected!109 () Bool)

(assert (=> b!260143 (= res!217849 (= (_1!12091 lt!402378) expected!109))))

(declare-fun thiss!1754 () BitStream!11380)

(declare-fun readBit!0 (BitStream!11380) tuple2!22310)

(assert (=> b!260143 (= lt!402378 (readBit!0 thiss!1754))))

(declare-fun b!260144 () Bool)

(declare-fun res!217850 () Bool)

(assert (=> b!260144 (=> (not res!217850) (not e!180551))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260144 (= res!217850 (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))) ((_ sign_extend 32) (currentByte!12419 thiss!1754)) ((_ sign_extend 32) (currentBit!12414 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217852 () Bool)

(assert (=> start!56020 (=> (not res!217852) (not e!180551))))

(assert (=> start!56020 (= res!217852 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!56020 e!180551))

(assert (=> start!56020 true))

(declare-fun e!180552 () Bool)

(declare-fun inv!12 (BitStream!11380) Bool)

(assert (=> start!56020 (and (inv!12 thiss!1754) e!180552)))

(declare-fun b!260145 () Bool)

(declare-fun res!217851 () Bool)

(assert (=> b!260145 (=> (not res!217851) (not e!180551))))

(assert (=> b!260145 (= res!217851 (not (= from!526 nBits!535)))))

(declare-fun b!260146 () Bool)

(declare-fun e!180548 () Bool)

(declare-fun e!180550 () Bool)

(assert (=> b!260146 (= e!180548 e!180550)))

(declare-fun res!217848 () Bool)

(assert (=> b!260146 (=> res!217848 e!180550)))

(declare-fun lt!402376 () tuple2!22310)

(assert (=> b!260146 (= res!217848 (or (not (_1!12091 lt!402376)) (bvsge from!526 nBits!535)))))

(declare-fun b!260147 () Bool)

(assert (=> b!260147 (= e!180553 (not e!180548))))

(declare-fun res!217847 () Bool)

(assert (=> b!260147 (=> (not res!217847) (not e!180548))))

(declare-fun lt!402377 () (_ BitVec 64))

(declare-fun lt!402379 () (_ BitVec 64))

(assert (=> b!260147 (= res!217847 (and (bvsge lt!402379 lt!402377) (= (buf!6751 thiss!1754) (buf!6751 (_2!12091 lt!402376))) (or (not (= nBits!535 from!526)) (_1!12091 lt!402376)) (or (not (_1!12091 lt!402376)) (= lt!402379 lt!402377))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260147 (= lt!402377 (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402376))) (currentByte!12419 (_2!12091 lt!402376)) (currentBit!12414 (_2!12091 lt!402376))))))

(assert (=> b!260147 (= lt!402379 (bvsub (bvadd (bitIndex!0 (size!6229 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754) (currentBit!12414 thiss!1754)) nBits!535) from!526))))

(declare-fun checkBitsLoop!0 (BitStream!11380 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22310)

(assert (=> b!260147 (= lt!402376 (checkBitsLoop!0 (_2!12091 lt!402378) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!260147 (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402378)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402378))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402378))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18501 0))(
  ( (Unit!18502) )
))
(declare-fun lt!402380 () Unit!18501)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11380 BitStream!11380 (_ BitVec 64) (_ BitVec 64)) Unit!18501)

(assert (=> b!260147 (= lt!402380 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12091 lt!402378) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!260148 () Bool)

(declare-fun array_inv!5970 (array!14232) Bool)

(assert (=> b!260148 (= e!180552 (array_inv!5970 (buf!6751 thiss!1754)))))

(declare-fun b!260149 () Bool)

(declare-datatypes ((tuple2!22312 0))(
  ( (tuple2!22313 (_1!12092 BitStream!11380) (_2!12092 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11380) tuple2!22312)

(assert (=> b!260149 (= e!180550 (= expected!109 (_2!12092 (readBitPure!0 thiss!1754))))))

(assert (= (and start!56020 res!217852) b!260144))

(assert (= (and b!260144 res!217850) b!260145))

(assert (= (and b!260145 res!217851) b!260143))

(assert (= (and b!260143 res!217849) b!260147))

(assert (= (and b!260147 res!217847) b!260146))

(assert (= (and b!260146 (not res!217848)) b!260149))

(assert (= start!56020 b!260148))

(declare-fun m!389387 () Bool)

(assert (=> b!260143 m!389387))

(declare-fun m!389389 () Bool)

(assert (=> start!56020 m!389389))

(declare-fun m!389391 () Bool)

(assert (=> b!260149 m!389391))

(declare-fun m!389393 () Bool)

(assert (=> b!260148 m!389393))

(declare-fun m!389395 () Bool)

(assert (=> b!260144 m!389395))

(declare-fun m!389397 () Bool)

(assert (=> b!260147 m!389397))

(declare-fun m!389399 () Bool)

(assert (=> b!260147 m!389399))

(declare-fun m!389401 () Bool)

(assert (=> b!260147 m!389401))

(declare-fun m!389403 () Bool)

(assert (=> b!260147 m!389403))

(declare-fun m!389405 () Bool)

(assert (=> b!260147 m!389405))

(push 1)

(assert (not b!260144))

(assert (not b!260148))

(assert (not b!260149))

(assert (not b!260147))

(assert (not b!260143))

(assert (not start!56020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87250 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))) ((_ sign_extend 32) (currentByte!12419 thiss!1754)) ((_ sign_extend 32) (currentBit!12414 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))) ((_ sign_extend 32) (currentByte!12419 thiss!1754)) ((_ sign_extend 32) (currentBit!12414 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22101 () Bool)

(assert (= bs!22101 d!87250))

(declare-fun m!389447 () Bool)

(assert (=> bs!22101 m!389447))

(assert (=> b!260144 d!87250))

(declare-fun d!87254 () Bool)

(declare-fun lt!402415 () tuple2!22310)

(assert (=> d!87254 (= lt!402415 (readBit!0 thiss!1754))))

(assert (=> d!87254 (= (readBitPure!0 thiss!1754) (tuple2!22313 (_2!12091 lt!402415) (_1!12091 lt!402415)))))

(declare-fun bs!22103 () Bool)

(assert (= bs!22103 d!87254))

(assert (=> bs!22103 m!389387))

(assert (=> b!260149 d!87254))

(declare-fun d!87258 () Bool)

(declare-fun e!180603 () Bool)

(assert (=> d!87258 e!180603))

(declare-fun res!217902 () Bool)

(assert (=> d!87258 (=> (not res!217902) (not e!180603))))

(declare-datatypes ((tuple2!22322 0))(
  ( (tuple2!22323 (_1!12097 Unit!18501) (_2!12097 BitStream!11380)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11380) tuple2!22322)

(assert (=> d!87258 (= res!217902 (= (buf!6751 (_2!12097 (increaseBitIndex!0 thiss!1754))) (buf!6751 thiss!1754)))))

(declare-fun lt!402461 () Bool)

(assert (=> d!87258 (= lt!402461 (not (= (bvand ((_ sign_extend 24) (select (arr!7216 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12414 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402459 () tuple2!22310)

(assert (=> d!87258 (= lt!402459 (tuple2!22311 (not (= (bvand ((_ sign_extend 24) (select (arr!7216 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12414 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12097 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87258 (validate_offset_bit!0 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))) ((_ sign_extend 32) (currentByte!12419 thiss!1754)) ((_ sign_extend 32) (currentBit!12414 thiss!1754)))))

(assert (=> d!87258 (= (readBit!0 thiss!1754) lt!402459)))

(declare-fun lt!402462 () (_ BitVec 64))

(declare-fun lt!402464 () (_ BitVec 64))

(declare-fun b!260205 () Bool)

(assert (=> b!260205 (= e!180603 (= (bitIndex!0 (size!6229 (buf!6751 (_2!12097 (increaseBitIndex!0 thiss!1754)))) (currentByte!12419 (_2!12097 (increaseBitIndex!0 thiss!1754))) (currentBit!12414 (_2!12097 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402464 lt!402462)))))

(assert (=> b!260205 (or (not (= (bvand lt!402464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402462 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402464 lt!402462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260205 (= lt!402462 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260205 (= lt!402464 (bitIndex!0 (size!6229 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754) (currentBit!12414 thiss!1754)))))

(declare-fun lt!402463 () Bool)

(assert (=> b!260205 (= lt!402463 (not (= (bvand ((_ sign_extend 24) (select (arr!7216 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12414 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402458 () Bool)

(assert (=> b!260205 (= lt!402458 (not (= (bvand ((_ sign_extend 24) (select (arr!7216 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12414 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402460 () Bool)

(assert (=> b!260205 (= lt!402460 (not (= (bvand ((_ sign_extend 24) (select (arr!7216 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12414 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87258 res!217902) b!260205))

(declare-fun m!389461 () Bool)

(assert (=> d!87258 m!389461))

(declare-fun m!389463 () Bool)

(assert (=> d!87258 m!389463))

(declare-fun m!389465 () Bool)

(assert (=> d!87258 m!389465))

(declare-fun m!389467 () Bool)

(assert (=> d!87258 m!389467))

(assert (=> b!260205 m!389463))

(assert (=> b!260205 m!389461))

(declare-fun m!389469 () Bool)

(assert (=> b!260205 m!389469))

(assert (=> b!260205 m!389465))

(assert (=> b!260205 m!389399))

(assert (=> b!260143 d!87258))

(declare-fun d!87270 () Bool)

(assert (=> d!87270 (= (array_inv!5970 (buf!6751 thiss!1754)) (bvsge (size!6229 (buf!6751 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!260148 d!87270))

(declare-fun d!87272 () Bool)

(declare-fun e!180606 () Bool)

(assert (=> d!87272 e!180606))

(declare-fun res!217905 () Bool)

(assert (=> d!87272 (=> (not res!217905) (not e!180606))))

(assert (=> d!87272 (= res!217905 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402467 () Unit!18501)

(declare-fun choose!27 (BitStream!11380 BitStream!11380 (_ BitVec 64) (_ BitVec 64)) Unit!18501)

(assert (=> d!87272 (= lt!402467 (choose!27 thiss!1754 (_2!12091 lt!402378) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87272 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87272 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12091 lt!402378) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402467)))

(declare-fun b!260208 () Bool)

(assert (=> b!260208 (= e!180606 (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402378)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402378))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402378))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87272 res!217905) b!260208))

(declare-fun m!389473 () Bool)

(assert (=> d!87272 m!389473))

(assert (=> b!260208 m!389401))

(assert (=> b!260147 d!87272))

(declare-fun d!87278 () Bool)

(declare-fun e!180612 () Bool)

(assert (=> d!87278 e!180612))

(declare-fun res!217917 () Bool)

(assert (=> d!87278 (=> (not res!217917) (not e!180612))))

(declare-fun lt!402503 () (_ BitVec 64))

(declare-fun lt!402502 () (_ BitVec 64))

(declare-fun lt!402498 () (_ BitVec 64))

(assert (=> d!87278 (= res!217917 (= lt!402498 (bvsub lt!402503 lt!402502)))))

(assert (=> d!87278 (or (= (bvand lt!402503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402503 lt!402502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87278 (= lt!402502 (remainingBits!0 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))) ((_ sign_extend 32) (currentByte!12419 thiss!1754)) ((_ sign_extend 32) (currentBit!12414 thiss!1754))))))

(declare-fun lt!402501 () (_ BitVec 64))

(declare-fun lt!402500 () (_ BitVec 64))

(assert (=> d!87278 (= lt!402503 (bvmul lt!402501 lt!402500))))

(assert (=> d!87278 (or (= lt!402501 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402500 (bvsdiv (bvmul lt!402501 lt!402500) lt!402501)))))

(assert (=> d!87278 (= lt!402500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87278 (= lt!402501 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))))))

(assert (=> d!87278 (= lt!402498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12419 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12414 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87278 (invariant!0 (currentBit!12414 thiss!1754) (currentByte!12419 thiss!1754) (size!6229 (buf!6751 thiss!1754)))))

(assert (=> d!87278 (= (bitIndex!0 (size!6229 (buf!6751 thiss!1754)) (currentByte!12419 thiss!1754) (currentBit!12414 thiss!1754)) lt!402498)))

(declare-fun b!260219 () Bool)

(declare-fun res!217916 () Bool)

(assert (=> b!260219 (=> (not res!217916) (not e!180612))))

(assert (=> b!260219 (= res!217916 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402498))))

(declare-fun b!260220 () Bool)

(declare-fun lt!402499 () (_ BitVec 64))

(assert (=> b!260220 (= e!180612 (bvsle lt!402498 (bvmul lt!402499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260220 (or (= lt!402499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402499)))))

(assert (=> b!260220 (= lt!402499 ((_ sign_extend 32) (size!6229 (buf!6751 thiss!1754))))))

(assert (= (and d!87278 res!217917) b!260219))

(assert (= (and b!260219 res!217916) b!260220))

(assert (=> d!87278 m!389447))

(declare-fun m!389479 () Bool)

(assert (=> d!87278 m!389479))

(assert (=> b!260147 d!87278))

(declare-fun d!87282 () Bool)

(assert (=> d!87282 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402378)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402378))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402378))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402378)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402378))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402378)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22107 () Bool)

(assert (= bs!22107 d!87282))

(declare-fun m!389481 () Bool)

(assert (=> bs!22107 m!389481))

(assert (=> b!260147 d!87282))

(declare-fun d!87284 () Bool)

(declare-fun e!180613 () Bool)

(assert (=> d!87284 e!180613))

(declare-fun res!217919 () Bool)

(assert (=> d!87284 (=> (not res!217919) (not e!180613))))

(declare-fun lt!402510 () (_ BitVec 64))

(declare-fun lt!402511 () (_ BitVec 64))

(declare-fun lt!402506 () (_ BitVec 64))

(assert (=> d!87284 (= res!217919 (= lt!402506 (bvsub lt!402511 lt!402510)))))

(assert (=> d!87284 (or (= (bvand lt!402511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402511 lt!402510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87284 (= lt!402510 (remainingBits!0 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402376)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402376))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402376)))))))

(declare-fun lt!402509 () (_ BitVec 64))

(declare-fun lt!402508 () (_ BitVec 64))

(assert (=> d!87284 (= lt!402511 (bvmul lt!402509 lt!402508))))

(assert (=> d!87284 (or (= lt!402509 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402508 (bvsdiv (bvmul lt!402509 lt!402508) lt!402509)))))

(assert (=> d!87284 (= lt!402508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87284 (= lt!402509 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402376)))))))

(assert (=> d!87284 (= lt!402506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402376)))))))

(assert (=> d!87284 (invariant!0 (currentBit!12414 (_2!12091 lt!402376)) (currentByte!12419 (_2!12091 lt!402376)) (size!6229 (buf!6751 (_2!12091 lt!402376))))))

(assert (=> d!87284 (= (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402376))) (currentByte!12419 (_2!12091 lt!402376)) (currentBit!12414 (_2!12091 lt!402376))) lt!402506)))

(declare-fun b!260221 () Bool)

(declare-fun res!217918 () Bool)

(assert (=> b!260221 (=> (not res!217918) (not e!180613))))

(assert (=> b!260221 (= res!217918 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402506))))

(declare-fun b!260222 () Bool)

(declare-fun lt!402507 () (_ BitVec 64))

(assert (=> b!260222 (= e!180613 (bvsle lt!402506 (bvmul lt!402507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260222 (or (= lt!402507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402507)))))

(assert (=> b!260222 (= lt!402507 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402376)))))))

(assert (= (and d!87284 res!217919) b!260221))

(assert (= (and b!260221 res!217918) b!260222))

(declare-fun m!389483 () Bool)

(assert (=> d!87284 m!389483))

(declare-fun m!389485 () Bool)

(assert (=> d!87284 m!389485))

(assert (=> b!260147 d!87284))

(declare-fun b!260293 () Bool)

(declare-fun e!180663 () Bool)

(declare-fun e!180660 () Bool)

(assert (=> b!260293 (= e!180663 e!180660)))

(declare-fun res!217963 () Bool)

(assert (=> b!260293 (=> res!217963 e!180660)))

(declare-fun lt!402618 () tuple2!22310)

(assert (=> b!260293 (= res!217963 (or (not (_1!12091 lt!402618)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260294 () Bool)

(declare-fun res!217962 () Bool)

(assert (=> b!260294 (=> (not res!217962) (not e!180663))))

(assert (=> b!260294 (= res!217962 (and (= (buf!6751 (_2!12091 lt!402378)) (buf!6751 (_2!12091 lt!402618))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12091 lt!402618))))))

(declare-fun b!260295 () Bool)

(declare-fun e!180662 () tuple2!22310)

(declare-fun lt!402613 () tuple2!22310)

(assert (=> b!260295 (= e!180662 (tuple2!22311 false (_2!12091 lt!402613)))))

(declare-fun b!260296 () Bool)

(declare-fun e!180661 () tuple2!22310)

(assert (=> b!260296 (= e!180661 (tuple2!22311 true (_2!12091 lt!402378)))))

(declare-fun b!260297 () Bool)

(assert (=> b!260297 (= e!180661 e!180662)))

(assert (=> b!260297 (= lt!402613 (readBit!0 (_2!12091 lt!402378)))))

(declare-fun c!11983 () Bool)

(assert (=> b!260297 (= c!11983 (not (= (_1!12091 lt!402613) expected!109)))))

(declare-fun d!87286 () Bool)

(assert (=> d!87286 e!180663))

(declare-fun res!217964 () Bool)

(assert (=> d!87286 (=> (not res!217964) (not e!180663))))

(declare-fun lt!402611 () (_ BitVec 64))

(assert (=> d!87286 (= res!217964 (bvsge (bvsub lt!402611 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402618))) (currentByte!12419 (_2!12091 lt!402618)) (currentBit!12414 (_2!12091 lt!402618)))))))

(assert (=> d!87286 (or (= (bvand lt!402611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402611 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402619 () (_ BitVec 64))

(assert (=> d!87286 (= lt!402611 (bvadd lt!402619 nBits!535))))

(assert (=> d!87286 (or (not (= (bvand lt!402619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402619 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87286 (= lt!402619 (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402378))) (currentByte!12419 (_2!12091 lt!402378)) (currentBit!12414 (_2!12091 lt!402378))))))

(assert (=> d!87286 (= lt!402618 e!180661)))

(declare-fun c!11982 () Bool)

(assert (=> d!87286 (= c!11982 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87286 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87286 (= (checkBitsLoop!0 (_2!12091 lt!402378) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402618)))

(declare-fun lt!402615 () tuple2!22310)

(declare-fun b!260298 () Bool)

(assert (=> b!260298 (= lt!402615 (checkBitsLoop!0 (_2!12091 lt!402613) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402616 () Unit!18501)

(declare-fun lt!402620 () Unit!18501)

(assert (=> b!260298 (= lt!402616 lt!402620)))

(declare-fun lt!402610 () (_ BitVec 64))

(declare-fun lt!402617 () (_ BitVec 64))

(assert (=> b!260298 (validate_offset_bits!1 ((_ sign_extend 32) (size!6229 (buf!6751 (_2!12091 lt!402613)))) ((_ sign_extend 32) (currentByte!12419 (_2!12091 lt!402613))) ((_ sign_extend 32) (currentBit!12414 (_2!12091 lt!402613))) (bvsub lt!402610 lt!402617))))

(assert (=> b!260298 (= lt!402620 (validateOffsetBitsIneqLemma!0 (_2!12091 lt!402378) (_2!12091 lt!402613) lt!402610 lt!402617))))

(assert (=> b!260298 (= lt!402617 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260298 (= lt!402610 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!260298 (= e!180662 (tuple2!22311 (_1!12091 lt!402615) (_2!12091 lt!402615)))))

(declare-fun e!180659 () Bool)

(declare-fun b!260299 () Bool)

(declare-fun lt!402614 () (_ BitVec 64))

(assert (=> b!260299 (= e!180659 (= (bvsub lt!402614 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402618))) (currentByte!12419 (_2!12091 lt!402618)) (currentBit!12414 (_2!12091 lt!402618)))))))

(assert (=> b!260299 (or (= (bvand lt!402614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402614 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402612 () (_ BitVec 64))

(assert (=> b!260299 (= lt!402614 (bvadd lt!402612 nBits!535))))

(assert (=> b!260299 (or (not (= (bvand lt!402612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402612 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260299 (= lt!402612 (bitIndex!0 (size!6229 (buf!6751 (_2!12091 lt!402378))) (currentByte!12419 (_2!12091 lt!402378)) (currentBit!12414 (_2!12091 lt!402378))))))

(declare-fun b!260300 () Bool)

(declare-fun res!217966 () Bool)

(assert (=> b!260300 (=> (not res!217966) (not e!180663))))

(assert (=> b!260300 (= res!217966 e!180659)))

(declare-fun res!217965 () Bool)

(assert (=> b!260300 (=> res!217965 e!180659)))

(assert (=> b!260300 (= res!217965 (not (_1!12091 lt!402618)))))

(declare-fun b!260301 () Bool)

(assert (=> b!260301 (= e!180660 (= expected!109 (_2!12092 (readBitPure!0 (_2!12091 lt!402378)))))))

(assert (= (and d!87286 c!11982) b!260296))

(assert (= (and d!87286 (not c!11982)) b!260297))

(assert (= (and b!260297 c!11983) b!260295))

(assert (= (and b!260297 (not c!11983)) b!260298))

(assert (= (and d!87286 res!217964) b!260294))

(assert (= (and b!260294 res!217962) b!260300))

(assert (= (and b!260300 (not res!217965)) b!260299))

(assert (= (and b!260300 res!217966) b!260293))

(assert (= (and b!260293 (not res!217963)) b!260301))

(declare-fun m!389507 () Bool)

(assert (=> d!87286 m!389507))

(declare-fun m!389509 () Bool)

(assert (=> d!87286 m!389509))

(assert (=> b!260299 m!389507))

(assert (=> b!260299 m!389509))

(declare-fun m!389511 () Bool)

(assert (=> b!260301 m!389511))

(declare-fun m!389513 () Bool)

(assert (=> b!260298 m!389513))

(declare-fun m!389515 () Bool)

(assert (=> b!260298 m!389515))

(declare-fun m!389517 () Bool)

(assert (=> b!260298 m!389517))

(declare-fun m!389519 () Bool)

(assert (=> b!260297 m!389519))

(assert (=> b!260147 d!87286))

(declare-fun d!87298 () Bool)

(assert (=> d!87298 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12414 thiss!1754) (currentByte!12419 thiss!1754) (size!6229 (buf!6751 thiss!1754))))))

(declare-fun bs!22109 () Bool)

(assert (= bs!22109 d!87298))

(assert (=> bs!22109 m!389479))

(assert (=> start!56020 d!87298))

(push 1)

(assert (not d!87282))

(assert (not d!87250))

(assert (not d!87254))

(assert (not b!260301))

(assert (not d!87286))

(assert (not d!87258))

(assert (not b!260298))

(assert (not d!87278))

(assert (not b!260205))

(assert (not d!87272))

(assert (not b!260208))

(assert (not d!87284))

(assert (not b!260297))

(assert (not b!260299))

(assert (not d!87298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

