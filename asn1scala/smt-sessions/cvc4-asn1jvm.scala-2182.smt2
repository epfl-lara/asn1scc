; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55316 () Bool)

(assert start!55316)

(declare-fun b!258019 () Bool)

(declare-fun e!178947 () Bool)

(declare-fun e!178945 () Bool)

(assert (=> b!258019 (= e!178947 e!178945)))

(declare-fun res!216198 () Bool)

(assert (=> b!258019 (=> (not res!216198) (not e!178945))))

(declare-datatypes ((array!14038 0))(
  ( (array!14039 (arr!7143 (Array (_ BitVec 32) (_ BitVec 8))) (size!6156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11234 0))(
  ( (BitStream!11235 (buf!6678 array!14038) (currentByte!12244 (_ BitVec 32)) (currentBit!12239 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22086 0))(
  ( (tuple2!22087 (_1!11979 Bool) (_2!11979 BitStream!11234)) )
))
(declare-fun lt!399422 () tuple2!22086)

(declare-fun expected!109 () Bool)

(assert (=> b!258019 (= res!216198 (= (_1!11979 lt!399422) expected!109))))

(declare-fun thiss!1754 () BitStream!11234)

(declare-fun readBit!0 (BitStream!11234) tuple2!22086)

(assert (=> b!258019 (= lt!399422 (readBit!0 thiss!1754))))

(declare-fun b!258020 () Bool)

(declare-fun res!216199 () Bool)

(declare-fun e!178948 () Bool)

(assert (=> b!258020 (=> res!216199 e!178948)))

(declare-fun lt!399421 () tuple2!22086)

(assert (=> b!258020 (= res!216199 (or (not (= (buf!6678 thiss!1754) (buf!6678 (_2!11979 lt!399421)))) (not (_1!11979 lt!399421))))))

(declare-fun b!258021 () Bool)

(declare-fun e!178946 () Bool)

(declare-fun array_inv!5897 (array!14038) Bool)

(assert (=> b!258021 (= e!178946 (array_inv!5897 (buf!6678 thiss!1754)))))

(declare-fun b!258022 () Bool)

(declare-fun res!216195 () Bool)

(assert (=> b!258022 (=> (not res!216195) (not e!178947))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258022 (= res!216195 (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))) ((_ sign_extend 32) (currentByte!12244 thiss!1754)) ((_ sign_extend 32) (currentBit!12239 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258023 () Bool)

(assert (=> b!258023 (= e!178945 (not e!178948))))

(declare-fun res!216197 () Bool)

(assert (=> b!258023 (=> res!216197 e!178948)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258023 (= res!216197 (bvslt (bvsub (bvadd (bitIndex!0 (size!6156 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754) (currentBit!12239 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399421))) (currentByte!12244 (_2!11979 lt!399421)) (currentBit!12239 (_2!11979 lt!399421)))))))

(declare-fun checkBitsLoop!0 (BitStream!11234 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22086)

(assert (=> b!258023 (= lt!399421 (checkBitsLoop!0 (_2!11979 lt!399422) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258023 (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399422)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399422))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399422))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18421 0))(
  ( (Unit!18422) )
))
(declare-fun lt!399420 () Unit!18421)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11234 BitStream!11234 (_ BitVec 64) (_ BitVec 64)) Unit!18421)

(assert (=> b!258023 (= lt!399420 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11979 lt!399422) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258024 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258024 (= e!178948 (invariant!0 (currentBit!12239 thiss!1754) (currentByte!12244 thiss!1754) (size!6156 (buf!6678 thiss!1754))))))

(declare-fun res!216196 () Bool)

(assert (=> start!55316 (=> (not res!216196) (not e!178947))))

(assert (=> start!55316 (= res!216196 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55316 e!178947))

(assert (=> start!55316 true))

(declare-fun inv!12 (BitStream!11234) Bool)

(assert (=> start!55316 (and (inv!12 thiss!1754) e!178946)))

(declare-fun b!258025 () Bool)

(declare-fun res!216194 () Bool)

(assert (=> b!258025 (=> (not res!216194) (not e!178947))))

(assert (=> b!258025 (= res!216194 (not (= from!526 nBits!535)))))

(assert (= (and start!55316 res!216196) b!258022))

(assert (= (and b!258022 res!216195) b!258025))

(assert (= (and b!258025 res!216194) b!258019))

(assert (= (and b!258019 res!216198) b!258023))

(assert (= (and b!258023 (not res!216197)) b!258020))

(assert (= (and b!258020 (not res!216199)) b!258024))

(assert (= start!55316 b!258021))

(declare-fun m!387531 () Bool)

(assert (=> b!258023 m!387531))

(declare-fun m!387533 () Bool)

(assert (=> b!258023 m!387533))

(declare-fun m!387535 () Bool)

(assert (=> b!258023 m!387535))

(declare-fun m!387537 () Bool)

(assert (=> b!258023 m!387537))

(declare-fun m!387539 () Bool)

(assert (=> b!258023 m!387539))

(declare-fun m!387541 () Bool)

(assert (=> b!258024 m!387541))

(declare-fun m!387543 () Bool)

(assert (=> b!258022 m!387543))

(declare-fun m!387545 () Bool)

(assert (=> start!55316 m!387545))

(declare-fun m!387547 () Bool)

(assert (=> b!258021 m!387547))

(declare-fun m!387549 () Bool)

(assert (=> b!258019 m!387549))

(push 1)

(assert (not b!258023))

(assert (not b!258019))

(assert (not b!258021))

(assert (not b!258024))

(assert (not b!258022))

(assert (not start!55316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86574 () Bool)

(declare-fun e!178977 () Bool)

(assert (=> d!86574 e!178977))

(declare-fun res!216220 () Bool)

(assert (=> d!86574 (=> (not res!216220) (not e!178977))))

(declare-datatypes ((tuple2!22092 0))(
  ( (tuple2!22093 (_1!11982 Unit!18421) (_2!11982 BitStream!11234)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11234) tuple2!22092)

(assert (=> d!86574 (= res!216220 (= (buf!6678 (_2!11982 (increaseBitIndex!0 thiss!1754))) (buf!6678 thiss!1754)))))

(declare-fun lt!399494 () Bool)

(assert (=> d!86574 (= lt!399494 (not (= (bvand ((_ sign_extend 24) (select (arr!7143 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12239 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399496 () tuple2!22086)

(assert (=> d!86574 (= lt!399496 (tuple2!22087 (not (= (bvand ((_ sign_extend 24) (select (arr!7143 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12239 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11982 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86574 (validate_offset_bit!0 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))) ((_ sign_extend 32) (currentByte!12244 thiss!1754)) ((_ sign_extend 32) (currentBit!12239 thiss!1754)))))

(assert (=> d!86574 (= (readBit!0 thiss!1754) lt!399496)))

(declare-fun b!258058 () Bool)

(declare-fun lt!399497 () (_ BitVec 64))

(declare-fun lt!399493 () (_ BitVec 64))

(assert (=> b!258058 (= e!178977 (= (bitIndex!0 (size!6156 (buf!6678 (_2!11982 (increaseBitIndex!0 thiss!1754)))) (currentByte!12244 (_2!11982 (increaseBitIndex!0 thiss!1754))) (currentBit!12239 (_2!11982 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399497 lt!399493)))))

(assert (=> b!258058 (or (not (= (bvand lt!399497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399493 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399497 lt!399493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258058 (= lt!399493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258058 (= lt!399497 (bitIndex!0 (size!6156 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754) (currentBit!12239 thiss!1754)))))

(declare-fun lt!399495 () Bool)

(assert (=> b!258058 (= lt!399495 (not (= (bvand ((_ sign_extend 24) (select (arr!7143 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12239 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399492 () Bool)

(assert (=> b!258058 (= lt!399492 (not (= (bvand ((_ sign_extend 24) (select (arr!7143 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12239 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399491 () Bool)

(assert (=> b!258058 (= lt!399491 (not (= (bvand ((_ sign_extend 24) (select (arr!7143 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12239 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86574 res!216220) b!258058))

(declare-fun m!387563 () Bool)

(assert (=> d!86574 m!387563))

(declare-fun m!387565 () Bool)

(assert (=> d!86574 m!387565))

(declare-fun m!387567 () Bool)

(assert (=> d!86574 m!387567))

(declare-fun m!387569 () Bool)

(assert (=> d!86574 m!387569))

(assert (=> b!258058 m!387565))

(assert (=> b!258058 m!387567))

(assert (=> b!258058 m!387535))

(assert (=> b!258058 m!387563))

(declare-fun m!387579 () Bool)

(assert (=> b!258058 m!387579))

(assert (=> b!258019 d!86574))

(declare-fun d!86578 () Bool)

(assert (=> d!86578 (= (invariant!0 (currentBit!12239 thiss!1754) (currentByte!12244 thiss!1754) (size!6156 (buf!6678 thiss!1754))) (and (bvsge (currentBit!12239 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12239 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12244 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12244 thiss!1754) (size!6156 (buf!6678 thiss!1754))) (and (= (currentBit!12239 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12244 thiss!1754) (size!6156 (buf!6678 thiss!1754)))))))))

(assert (=> b!258024 d!86578))

(declare-fun d!86582 () Bool)

(declare-fun e!178984 () Bool)

(assert (=> d!86582 e!178984))

(declare-fun res!216234 () Bool)

(assert (=> d!86582 (=> (not res!216234) (not e!178984))))

(declare-fun lt!399538 () (_ BitVec 64))

(declare-fun lt!399537 () (_ BitVec 64))

(declare-fun lt!399539 () (_ BitVec 64))

(assert (=> d!86582 (= res!216234 (= lt!399539 (bvsub lt!399537 lt!399538)))))

(assert (=> d!86582 (or (= (bvand lt!399537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399538 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399537 lt!399538) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86582 (= lt!399538 (remainingBits!0 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))) ((_ sign_extend 32) (currentByte!12244 thiss!1754)) ((_ sign_extend 32) (currentBit!12239 thiss!1754))))))

(declare-fun lt!399536 () (_ BitVec 64))

(declare-fun lt!399535 () (_ BitVec 64))

(assert (=> d!86582 (= lt!399537 (bvmul lt!399536 lt!399535))))

(assert (=> d!86582 (or (= lt!399536 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399535 (bvsdiv (bvmul lt!399536 lt!399535) lt!399536)))))

(assert (=> d!86582 (= lt!399535 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86582 (= lt!399536 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))))))

(assert (=> d!86582 (= lt!399539 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12244 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12239 thiss!1754))))))

(assert (=> d!86582 (invariant!0 (currentBit!12239 thiss!1754) (currentByte!12244 thiss!1754) (size!6156 (buf!6678 thiss!1754)))))

(assert (=> d!86582 (= (bitIndex!0 (size!6156 (buf!6678 thiss!1754)) (currentByte!12244 thiss!1754) (currentBit!12239 thiss!1754)) lt!399539)))

(declare-fun b!258071 () Bool)

(declare-fun res!216233 () Bool)

(assert (=> b!258071 (=> (not res!216233) (not e!178984))))

(assert (=> b!258071 (= res!216233 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399539))))

(declare-fun b!258072 () Bool)

(declare-fun lt!399534 () (_ BitVec 64))

(assert (=> b!258072 (= e!178984 (bvsle lt!399539 (bvmul lt!399534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258072 (or (= lt!399534 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399534 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399534)))))

(assert (=> b!258072 (= lt!399534 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))))))

(assert (= (and d!86582 res!216234) b!258071))

(assert (= (and b!258071 res!216233) b!258072))

(declare-fun m!387593 () Bool)

(assert (=> d!86582 m!387593))

(assert (=> d!86582 m!387541))

(assert (=> b!258023 d!86582))

(declare-fun d!86590 () Bool)

(assert (=> d!86590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399422)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399422))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399422))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399422)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399422))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399422)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21906 () Bool)

(assert (= bs!21906 d!86590))

(declare-fun m!387595 () Bool)

(assert (=> bs!21906 m!387595))

(assert (=> b!258023 d!86590))

(declare-fun d!86592 () Bool)

(declare-fun e!178985 () Bool)

(assert (=> d!86592 e!178985))

(declare-fun res!216236 () Bool)

(assert (=> d!86592 (=> (not res!216236) (not e!178985))))

(declare-fun lt!399545 () (_ BitVec 64))

(declare-fun lt!399544 () (_ BitVec 64))

(declare-fun lt!399543 () (_ BitVec 64))

(assert (=> d!86592 (= res!216236 (= lt!399545 (bvsub lt!399543 lt!399544)))))

(assert (=> d!86592 (or (= (bvand lt!399543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399544 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399543 lt!399544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86592 (= lt!399544 (remainingBits!0 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399421)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399421))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399421)))))))

(declare-fun lt!399542 () (_ BitVec 64))

(declare-fun lt!399541 () (_ BitVec 64))

(assert (=> d!86592 (= lt!399543 (bvmul lt!399542 lt!399541))))

(assert (=> d!86592 (or (= lt!399542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399541 (bvsdiv (bvmul lt!399542 lt!399541) lt!399542)))))

(assert (=> d!86592 (= lt!399541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86592 (= lt!399542 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399421)))))))

(assert (=> d!86592 (= lt!399545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399421))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399421)))))))

(assert (=> d!86592 (invariant!0 (currentBit!12239 (_2!11979 lt!399421)) (currentByte!12244 (_2!11979 lt!399421)) (size!6156 (buf!6678 (_2!11979 lt!399421))))))

(assert (=> d!86592 (= (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399421))) (currentByte!12244 (_2!11979 lt!399421)) (currentBit!12239 (_2!11979 lt!399421))) lt!399545)))

(declare-fun b!258073 () Bool)

(declare-fun res!216235 () Bool)

(assert (=> b!258073 (=> (not res!216235) (not e!178985))))

(assert (=> b!258073 (= res!216235 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399545))))

(declare-fun b!258074 () Bool)

(declare-fun lt!399540 () (_ BitVec 64))

(assert (=> b!258074 (= e!178985 (bvsle lt!399545 (bvmul lt!399540 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258074 (or (= lt!399540 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399540 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399540)))))

(assert (=> b!258074 (= lt!399540 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399421)))))))

(assert (= (and d!86592 res!216236) b!258073))

(assert (= (and b!258073 res!216235) b!258074))

(declare-fun m!387597 () Bool)

(assert (=> d!86592 m!387597))

(declare-fun m!387599 () Bool)

(assert (=> d!86592 m!387599))

(assert (=> b!258023 d!86592))

(declare-fun lt!399659 () tuple2!22086)

(declare-fun lt!399660 () (_ BitVec 64))

(declare-fun b!258137 () Bool)

(declare-fun e!179030 () Bool)

(assert (=> b!258137 (= e!179030 (= (bvsub lt!399660 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399659))) (currentByte!12244 (_2!11979 lt!399659)) (currentBit!12239 (_2!11979 lt!399659)))))))

(assert (=> b!258137 (or (= (bvand lt!399660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399660 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399654 () (_ BitVec 64))

(assert (=> b!258137 (= lt!399660 (bvadd lt!399654 nBits!535))))

(assert (=> b!258137 (or (not (= (bvand lt!399654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399654 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258137 (= lt!399654 (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399422))) (currentByte!12244 (_2!11979 lt!399422)) (currentBit!12239 (_2!11979 lt!399422))))))

(declare-fun b!258139 () Bool)

(declare-fun res!216282 () Bool)

(declare-fun e!179031 () Bool)

(assert (=> b!258139 (=> (not res!216282) (not e!179031))))

(assert (=> b!258139 (= res!216282 e!179030)))

(declare-fun res!216280 () Bool)

(assert (=> b!258139 (=> res!216280 e!179030)))

(assert (=> b!258139 (= res!216280 (not (_1!11979 lt!399659)))))

(declare-fun b!258140 () Bool)

(declare-fun e!179029 () tuple2!22086)

(declare-fun e!179032 () tuple2!22086)

(assert (=> b!258140 (= e!179029 e!179032)))

(declare-fun lt!399658 () tuple2!22086)

(assert (=> b!258140 (= lt!399658 (readBit!0 (_2!11979 lt!399422)))))

(declare-fun c!11858 () Bool)

(assert (=> b!258140 (= c!11858 (not (= (_1!11979 lt!399658) expected!109)))))

(declare-fun d!86594 () Bool)

(assert (=> d!86594 e!179031))

(declare-fun res!216283 () Bool)

(assert (=> d!86594 (=> (not res!216283) (not e!179031))))

(declare-fun lt!399656 () (_ BitVec 64))

(assert (=> d!86594 (= res!216283 (bvsge (bvsub lt!399656 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399659))) (currentByte!12244 (_2!11979 lt!399659)) (currentBit!12239 (_2!11979 lt!399659)))))))

(assert (=> d!86594 (or (= (bvand lt!399656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399656 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399652 () (_ BitVec 64))

(assert (=> d!86594 (= lt!399656 (bvadd lt!399652 nBits!535))))

(assert (=> d!86594 (or (not (= (bvand lt!399652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399652 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86594 (= lt!399652 (bitIndex!0 (size!6156 (buf!6678 (_2!11979 lt!399422))) (currentByte!12244 (_2!11979 lt!399422)) (currentBit!12239 (_2!11979 lt!399422))))))

(assert (=> d!86594 (= lt!399659 e!179029)))

(declare-fun c!11859 () Bool)

(assert (=> d!86594 (= c!11859 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86594 (= (checkBitsLoop!0 (_2!11979 lt!399422) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399659)))

(declare-fun b!258138 () Bool)

(declare-fun e!179028 () Bool)

(assert (=> b!258138 (= e!179031 e!179028)))

(declare-fun res!216281 () Bool)

(assert (=> b!258138 (=> res!216281 e!179028)))

(assert (=> b!258138 (= res!216281 (or (not (_1!11979 lt!399659)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258141 () Bool)

(assert (=> b!258141 (= e!179032 (tuple2!22087 false (_2!11979 lt!399658)))))

(declare-fun b!258142 () Bool)

(declare-datatypes ((tuple2!22098 0))(
  ( (tuple2!22099 (_1!11985 BitStream!11234) (_2!11985 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11234) tuple2!22098)

(assert (=> b!258142 (= e!179028 (= expected!109 (_2!11985 (readBitPure!0 (_2!11979 lt!399422)))))))

(declare-fun b!258143 () Bool)

(assert (=> b!258143 (= e!179029 (tuple2!22087 true (_2!11979 lt!399422)))))

(declare-fun lt!399662 () tuple2!22086)

(declare-fun b!258144 () Bool)

(assert (=> b!258144 (= lt!399662 (checkBitsLoop!0 (_2!11979 lt!399658) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399661 () Unit!18421)

(declare-fun lt!399655 () Unit!18421)

(assert (=> b!258144 (= lt!399661 lt!399655)))

(declare-fun lt!399657 () (_ BitVec 64))

(declare-fun lt!399653 () (_ BitVec 64))

(assert (=> b!258144 (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399658)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399658))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399658))) (bvsub lt!399657 lt!399653))))

(assert (=> b!258144 (= lt!399655 (validateOffsetBitsIneqLemma!0 (_2!11979 lt!399422) (_2!11979 lt!399658) lt!399657 lt!399653))))

(assert (=> b!258144 (= lt!399653 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258144 (= lt!399657 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258144 (= e!179032 (tuple2!22087 (_1!11979 lt!399662) (_2!11979 lt!399662)))))

(declare-fun b!258145 () Bool)

(declare-fun res!216279 () Bool)

(assert (=> b!258145 (=> (not res!216279) (not e!179031))))

(assert (=> b!258145 (= res!216279 (and (= (buf!6678 (_2!11979 lt!399422)) (buf!6678 (_2!11979 lt!399659))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11979 lt!399659))))))

(assert (= (and d!86594 c!11859) b!258143))

(assert (= (and d!86594 (not c!11859)) b!258140))

(assert (= (and b!258140 c!11858) b!258141))

(assert (= (and b!258140 (not c!11858)) b!258144))

(assert (= (and d!86594 res!216283) b!258145))

(assert (= (and b!258145 res!216279) b!258139))

(assert (= (and b!258139 (not res!216280)) b!258137))

(assert (= (and b!258139 res!216282) b!258138))

(assert (= (and b!258138 (not res!216281)) b!258142))

(declare-fun m!387637 () Bool)

(assert (=> b!258140 m!387637))

(declare-fun m!387639 () Bool)

(assert (=> b!258137 m!387639))

(declare-fun m!387641 () Bool)

(assert (=> b!258137 m!387641))

(declare-fun m!387643 () Bool)

(assert (=> b!258144 m!387643))

(declare-fun m!387645 () Bool)

(assert (=> b!258144 m!387645))

(declare-fun m!387647 () Bool)

(assert (=> b!258144 m!387647))

(assert (=> d!86594 m!387639))

(assert (=> d!86594 m!387641))

(declare-fun m!387649 () Bool)

(assert (=> b!258142 m!387649))

(assert (=> b!258023 d!86594))

(declare-fun d!86614 () Bool)

(declare-fun e!179035 () Bool)

(assert (=> d!86614 e!179035))

(declare-fun res!216286 () Bool)

(assert (=> d!86614 (=> (not res!216286) (not e!179035))))

(assert (=> d!86614 (= res!216286 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399665 () Unit!18421)

(declare-fun choose!27 (BitStream!11234 BitStream!11234 (_ BitVec 64) (_ BitVec 64)) Unit!18421)

(assert (=> d!86614 (= lt!399665 (choose!27 thiss!1754 (_2!11979 lt!399422) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86614 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11979 lt!399422) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399665)))

(declare-fun b!258148 () Bool)

(assert (=> b!258148 (= e!179035 (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 (_2!11979 lt!399422)))) ((_ sign_extend 32) (currentByte!12244 (_2!11979 lt!399422))) ((_ sign_extend 32) (currentBit!12239 (_2!11979 lt!399422))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86614 res!216286) b!258148))

(declare-fun m!387651 () Bool)

(assert (=> d!86614 m!387651))

(assert (=> b!258148 m!387539))

(assert (=> b!258023 d!86614))

(declare-fun d!86616 () Bool)

(assert (=> d!86616 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))) ((_ sign_extend 32) (currentByte!12244 thiss!1754)) ((_ sign_extend 32) (currentBit!12239 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6156 (buf!6678 thiss!1754))) ((_ sign_extend 32) (currentByte!12244 thiss!1754)) ((_ sign_extend 32) (currentBit!12239 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21910 () Bool)

(assert (= bs!21910 d!86616))

(assert (=> bs!21910 m!387593))

