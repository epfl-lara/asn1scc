; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55878 () Bool)

(assert start!55878)

(declare-fun b!259638 () Bool)

(declare-fun res!217474 () Bool)

(declare-fun e!180172 () Bool)

(assert (=> b!259638 (=> (not res!217474) (not e!180172))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259638 (= res!217474 (not (= from!526 nBits!535)))))

(declare-fun b!259639 () Bool)

(declare-fun res!217475 () Bool)

(assert (=> b!259639 (=> (not res!217475) (not e!180172))))

(declare-datatypes ((array!14207 0))(
  ( (array!14208 (arr!7208 (Array (_ BitVec 32) (_ BitVec 8))) (size!6221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11364 0))(
  ( (BitStream!11365 (buf!6743 array!14207) (currentByte!12393 (_ BitVec 32)) (currentBit!12388 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11364)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259639 (= res!217475 (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))) ((_ sign_extend 32) (currentByte!12393 thiss!1754)) ((_ sign_extend 32) (currentBit!12388 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259640 () Bool)

(declare-fun e!180174 () Bool)

(declare-fun array_inv!5962 (array!14207) Bool)

(assert (=> b!259640 (= e!180174 (array_inv!5962 (buf!6743 thiss!1754)))))

(declare-fun e!180173 () Bool)

(declare-fun lt!401549 () (_ BitVec 64))

(declare-fun b!259641 () Bool)

(declare-fun lt!401546 () (_ BitVec 64))

(assert (=> b!259641 (= e!180173 (not (or (= lt!401549 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!401549 (bvand (bvsub lt!401546 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259641 (= lt!401549 (bvand lt!401546 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259641 (= lt!401546 (bvadd (bitIndex!0 (size!6221 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754) (currentBit!12388 thiss!1754)) nBits!535))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22258 0))(
  ( (tuple2!22259 (_1!12065 Bool) (_2!12065 BitStream!11364)) )
))
(declare-fun lt!401548 () tuple2!22258)

(declare-fun lt!401545 () tuple2!22258)

(declare-fun checkBitsLoop!0 (BitStream!11364 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22258)

(assert (=> b!259641 (= lt!401548 (checkBitsLoop!0 (_2!12065 lt!401545) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259641 (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 (_2!12065 lt!401545)))) ((_ sign_extend 32) (currentByte!12393 (_2!12065 lt!401545))) ((_ sign_extend 32) (currentBit!12388 (_2!12065 lt!401545))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18485 0))(
  ( (Unit!18486) )
))
(declare-fun lt!401547 () Unit!18485)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11364 BitStream!11364 (_ BitVec 64) (_ BitVec 64)) Unit!18485)

(assert (=> b!259641 (= lt!401547 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12065 lt!401545) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259642 () Bool)

(assert (=> b!259642 (= e!180172 e!180173)))

(declare-fun res!217476 () Bool)

(assert (=> b!259642 (=> (not res!217476) (not e!180173))))

(assert (=> b!259642 (= res!217476 (= (_1!12065 lt!401545) expected!109))))

(declare-fun readBit!0 (BitStream!11364) tuple2!22258)

(assert (=> b!259642 (= lt!401545 (readBit!0 thiss!1754))))

(declare-fun res!217477 () Bool)

(assert (=> start!55878 (=> (not res!217477) (not e!180172))))

(assert (=> start!55878 (= res!217477 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55878 e!180172))

(assert (=> start!55878 true))

(declare-fun inv!12 (BitStream!11364) Bool)

(assert (=> start!55878 (and (inv!12 thiss!1754) e!180174)))

(assert (= (and start!55878 res!217477) b!259639))

(assert (= (and b!259639 res!217475) b!259638))

(assert (= (and b!259638 res!217474) b!259642))

(assert (= (and b!259642 res!217476) b!259641))

(assert (= start!55878 b!259640))

(declare-fun m!388935 () Bool)

(assert (=> b!259642 m!388935))

(declare-fun m!388937 () Bool)

(assert (=> b!259641 m!388937))

(declare-fun m!388939 () Bool)

(assert (=> b!259641 m!388939))

(declare-fun m!388941 () Bool)

(assert (=> b!259641 m!388941))

(declare-fun m!388943 () Bool)

(assert (=> b!259641 m!388943))

(declare-fun m!388945 () Bool)

(assert (=> b!259639 m!388945))

(declare-fun m!388947 () Bool)

(assert (=> start!55878 m!388947))

(declare-fun m!388949 () Bool)

(assert (=> b!259640 m!388949))

(check-sat (not b!259640) (not b!259642) (not b!259641) (not b!259639) (not start!55878))
(check-sat)
(get-model)

(declare-fun d!87088 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87088 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))) ((_ sign_extend 32) (currentByte!12393 thiss!1754)) ((_ sign_extend 32) (currentBit!12388 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))) ((_ sign_extend 32) (currentByte!12393 thiss!1754)) ((_ sign_extend 32) (currentBit!12388 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22065 () Bool)

(assert (= bs!22065 d!87088))

(declare-fun m!388967 () Bool)

(assert (=> bs!22065 m!388967))

(assert (=> b!259639 d!87088))

(declare-fun d!87090 () Bool)

(assert (=> d!87090 (= (array_inv!5962 (buf!6743 thiss!1754)) (bvsge (size!6221 (buf!6743 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259640 d!87090))

(declare-fun d!87092 () Bool)

(declare-fun e!180194 () Bool)

(assert (=> d!87092 e!180194))

(declare-fun res!217492 () Bool)

(assert (=> d!87092 (=> (not res!217492) (not e!180194))))

(declare-datatypes ((tuple2!22262 0))(
  ( (tuple2!22263 (_1!12067 Unit!18485) (_2!12067 BitStream!11364)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11364) tuple2!22262)

(assert (=> d!87092 (= res!217492 (= (buf!6743 (_2!12067 (increaseBitIndex!0 thiss!1754))) (buf!6743 thiss!1754)))))

(declare-fun lt!401582 () Bool)

(assert (=> d!87092 (= lt!401582 (not (= (bvand ((_ sign_extend 24) (select (arr!7208 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12388 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401583 () tuple2!22258)

(assert (=> d!87092 (= lt!401583 (tuple2!22259 (not (= (bvand ((_ sign_extend 24) (select (arr!7208 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12388 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12067 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87092 (validate_offset_bit!0 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))) ((_ sign_extend 32) (currentByte!12393 thiss!1754)) ((_ sign_extend 32) (currentBit!12388 thiss!1754)))))

(assert (=> d!87092 (= (readBit!0 thiss!1754) lt!401583)))

(declare-fun b!259660 () Bool)

(declare-fun lt!401580 () (_ BitVec 64))

(declare-fun lt!401579 () (_ BitVec 64))

(assert (=> b!259660 (= e!180194 (= (bitIndex!0 (size!6221 (buf!6743 (_2!12067 (increaseBitIndex!0 thiss!1754)))) (currentByte!12393 (_2!12067 (increaseBitIndex!0 thiss!1754))) (currentBit!12388 (_2!12067 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401579 lt!401580)))))

(assert (=> b!259660 (or (not (= (bvand lt!401579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401580 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401579 lt!401580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259660 (= lt!401580 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259660 (= lt!401579 (bitIndex!0 (size!6221 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754) (currentBit!12388 thiss!1754)))))

(declare-fun lt!401581 () Bool)

(assert (=> b!259660 (= lt!401581 (not (= (bvand ((_ sign_extend 24) (select (arr!7208 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12388 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401585 () Bool)

(assert (=> b!259660 (= lt!401585 (not (= (bvand ((_ sign_extend 24) (select (arr!7208 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12388 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401584 () Bool)

(assert (=> b!259660 (= lt!401584 (not (= (bvand ((_ sign_extend 24) (select (arr!7208 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12388 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87092 res!217492) b!259660))

(declare-fun m!388975 () Bool)

(assert (=> d!87092 m!388975))

(declare-fun m!388977 () Bool)

(assert (=> d!87092 m!388977))

(declare-fun m!388979 () Bool)

(assert (=> d!87092 m!388979))

(declare-fun m!388981 () Bool)

(assert (=> d!87092 m!388981))

(assert (=> b!259660 m!388975))

(assert (=> b!259660 m!388937))

(assert (=> b!259660 m!388977))

(assert (=> b!259660 m!388979))

(declare-fun m!388983 () Bool)

(assert (=> b!259660 m!388983))

(assert (=> b!259642 d!87092))

(declare-fun d!87106 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87106 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12388 thiss!1754) (currentByte!12393 thiss!1754) (size!6221 (buf!6743 thiss!1754))))))

(declare-fun bs!22069 () Bool)

(assert (= bs!22069 d!87106))

(declare-fun m!388985 () Bool)

(assert (=> bs!22069 m!388985))

(assert (=> start!55878 d!87106))

(declare-fun d!87108 () Bool)

(declare-fun e!180204 () Bool)

(assert (=> d!87108 e!180204))

(declare-fun res!217504 () Bool)

(assert (=> d!87108 (=> (not res!217504) (not e!180204))))

(declare-fun lt!401616 () (_ BitVec 64))

(declare-fun lt!401619 () (_ BitVec 64))

(declare-fun lt!401620 () (_ BitVec 64))

(assert (=> d!87108 (= res!217504 (= lt!401616 (bvsub lt!401619 lt!401620)))))

(assert (=> d!87108 (or (= (bvand lt!401619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401619 lt!401620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87108 (= lt!401620 (remainingBits!0 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))) ((_ sign_extend 32) (currentByte!12393 thiss!1754)) ((_ sign_extend 32) (currentBit!12388 thiss!1754))))))

(declare-fun lt!401621 () (_ BitVec 64))

(declare-fun lt!401618 () (_ BitVec 64))

(assert (=> d!87108 (= lt!401619 (bvmul lt!401621 lt!401618))))

(assert (=> d!87108 (or (= lt!401621 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401618 (bvsdiv (bvmul lt!401621 lt!401618) lt!401621)))))

(assert (=> d!87108 (= lt!401618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87108 (= lt!401621 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))))))

(assert (=> d!87108 (= lt!401616 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12393 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12388 thiss!1754))))))

(assert (=> d!87108 (invariant!0 (currentBit!12388 thiss!1754) (currentByte!12393 thiss!1754) (size!6221 (buf!6743 thiss!1754)))))

(assert (=> d!87108 (= (bitIndex!0 (size!6221 (buf!6743 thiss!1754)) (currentByte!12393 thiss!1754) (currentBit!12388 thiss!1754)) lt!401616)))

(declare-fun b!259671 () Bool)

(declare-fun res!217503 () Bool)

(assert (=> b!259671 (=> (not res!217503) (not e!180204))))

(assert (=> b!259671 (= res!217503 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401616))))

(declare-fun b!259672 () Bool)

(declare-fun lt!401617 () (_ BitVec 64))

(assert (=> b!259672 (= e!180204 (bvsle lt!401616 (bvmul lt!401617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259672 (or (= lt!401617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401617)))))

(assert (=> b!259672 (= lt!401617 ((_ sign_extend 32) (size!6221 (buf!6743 thiss!1754))))))

(assert (= (and d!87108 res!217504) b!259671))

(assert (= (and b!259671 res!217503) b!259672))

(assert (=> d!87108 m!388967))

(assert (=> d!87108 m!388985))

(assert (=> b!259641 d!87108))

(declare-fun b!259727 () Bool)

(declare-fun e!180240 () tuple2!22258)

(declare-fun e!180239 () tuple2!22258)

(assert (=> b!259727 (= e!180240 e!180239)))

(declare-fun lt!401718 () tuple2!22258)

(assert (=> b!259727 (= lt!401718 (readBit!0 (_2!12065 lt!401545)))))

(declare-fun c!11925 () Bool)

(assert (=> b!259727 (= c!11925 (not (= (_1!12065 lt!401718) expected!109)))))

(declare-fun b!259728 () Bool)

(assert (=> b!259728 (= e!180239 (tuple2!22259 false (_2!12065 lt!401718)))))

(declare-fun b!259729 () Bool)

(assert (=> b!259729 (= e!180240 (tuple2!22259 true (_2!12065 lt!401545)))))

(declare-fun b!259730 () Bool)

(declare-fun lt!401720 () tuple2!22258)

(assert (=> b!259730 (= lt!401720 (checkBitsLoop!0 (_2!12065 lt!401718) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401726 () Unit!18485)

(declare-fun lt!401719 () Unit!18485)

(assert (=> b!259730 (= lt!401726 lt!401719)))

(declare-fun lt!401722 () (_ BitVec 64))

(declare-fun lt!401724 () (_ BitVec 64))

(assert (=> b!259730 (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 (_2!12065 lt!401718)))) ((_ sign_extend 32) (currentByte!12393 (_2!12065 lt!401718))) ((_ sign_extend 32) (currentBit!12388 (_2!12065 lt!401718))) (bvsub lt!401722 lt!401724))))

(assert (=> b!259730 (= lt!401719 (validateOffsetBitsIneqLemma!0 (_2!12065 lt!401545) (_2!12065 lt!401718) lt!401722 lt!401724))))

(assert (=> b!259730 (= lt!401724 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259730 (= lt!401722 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259730 (= e!180239 (tuple2!22259 (_1!12065 lt!401720) (_2!12065 lt!401720)))))

(declare-fun e!180237 () Bool)

(declare-fun lt!401723 () tuple2!22258)

(declare-fun b!259731 () Bool)

(declare-fun lt!401716 () (_ BitVec 64))

(assert (=> b!259731 (= e!180237 (= (bvsub lt!401716 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6221 (buf!6743 (_2!12065 lt!401723))) (currentByte!12393 (_2!12065 lt!401723)) (currentBit!12388 (_2!12065 lt!401723)))))))

(assert (=> b!259731 (or (= (bvand lt!401716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401716 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401717 () (_ BitVec 64))

(assert (=> b!259731 (= lt!401716 (bvadd lt!401717 nBits!535))))

(assert (=> b!259731 (or (not (= (bvand lt!401717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401717 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259731 (= lt!401717 (bitIndex!0 (size!6221 (buf!6743 (_2!12065 lt!401545))) (currentByte!12393 (_2!12065 lt!401545)) (currentBit!12388 (_2!12065 lt!401545))))))

(declare-fun b!259732 () Bool)

(declare-fun res!217541 () Bool)

(declare-fun e!180238 () Bool)

(assert (=> b!259732 (=> (not res!217541) (not e!180238))))

(assert (=> b!259732 (= res!217541 (and (= (buf!6743 (_2!12065 lt!401545)) (buf!6743 (_2!12065 lt!401723))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12065 lt!401723))))))

(declare-fun b!259733 () Bool)

(declare-fun e!180236 () Bool)

(assert (=> b!259733 (= e!180238 e!180236)))

(declare-fun res!217542 () Bool)

(assert (=> b!259733 (=> res!217542 e!180236)))

(assert (=> b!259733 (= res!217542 (or (not (_1!12065 lt!401723)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259734 () Bool)

(declare-fun res!217539 () Bool)

(assert (=> b!259734 (=> (not res!217539) (not e!180238))))

(assert (=> b!259734 (= res!217539 e!180237)))

(declare-fun res!217540 () Bool)

(assert (=> b!259734 (=> res!217540 e!180237)))

(assert (=> b!259734 (= res!217540 (not (_1!12065 lt!401723)))))

(declare-fun b!259735 () Bool)

(declare-datatypes ((tuple2!22264 0))(
  ( (tuple2!22265 (_1!12068 BitStream!11364) (_2!12068 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11364) tuple2!22264)

(assert (=> b!259735 (= e!180236 (= expected!109 (_2!12068 (readBitPure!0 (_2!12065 lt!401545)))))))

(declare-fun d!87112 () Bool)

(assert (=> d!87112 e!180238))

(declare-fun res!217543 () Bool)

(assert (=> d!87112 (=> (not res!217543) (not e!180238))))

(declare-fun lt!401725 () (_ BitVec 64))

(assert (=> d!87112 (= res!217543 (bvsge (bvsub lt!401725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6221 (buf!6743 (_2!12065 lt!401723))) (currentByte!12393 (_2!12065 lt!401723)) (currentBit!12388 (_2!12065 lt!401723)))))))

(assert (=> d!87112 (or (= (bvand lt!401725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401721 () (_ BitVec 64))

(assert (=> d!87112 (= lt!401725 (bvadd lt!401721 nBits!535))))

(assert (=> d!87112 (or (not (= (bvand lt!401721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401721 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87112 (= lt!401721 (bitIndex!0 (size!6221 (buf!6743 (_2!12065 lt!401545))) (currentByte!12393 (_2!12065 lt!401545)) (currentBit!12388 (_2!12065 lt!401545))))))

(assert (=> d!87112 (= lt!401723 e!180240)))

(declare-fun c!11924 () Bool)

(assert (=> d!87112 (= c!11924 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87112 (= (checkBitsLoop!0 (_2!12065 lt!401545) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401723)))

(assert (= (and d!87112 c!11924) b!259729))

(assert (= (and d!87112 (not c!11924)) b!259727))

(assert (= (and b!259727 c!11925) b!259728))

(assert (= (and b!259727 (not c!11925)) b!259730))

(assert (= (and d!87112 res!217543) b!259732))

(assert (= (and b!259732 res!217541) b!259734))

(assert (= (and b!259734 (not res!217540)) b!259731))

(assert (= (and b!259734 res!217539) b!259733))

(assert (= (and b!259733 (not res!217542)) b!259735))

(declare-fun m!389015 () Bool)

(assert (=> b!259730 m!389015))

(declare-fun m!389017 () Bool)

(assert (=> b!259730 m!389017))

(declare-fun m!389019 () Bool)

(assert (=> b!259730 m!389019))

(declare-fun m!389021 () Bool)

(assert (=> d!87112 m!389021))

(declare-fun m!389023 () Bool)

(assert (=> d!87112 m!389023))

(declare-fun m!389025 () Bool)

(assert (=> b!259735 m!389025))

(declare-fun m!389027 () Bool)

(assert (=> b!259727 m!389027))

(assert (=> b!259731 m!389021))

(assert (=> b!259731 m!389023))

(assert (=> b!259641 d!87112))

(declare-fun d!87122 () Bool)

(assert (=> d!87122 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 (_2!12065 lt!401545)))) ((_ sign_extend 32) (currentByte!12393 (_2!12065 lt!401545))) ((_ sign_extend 32) (currentBit!12388 (_2!12065 lt!401545))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6221 (buf!6743 (_2!12065 lt!401545)))) ((_ sign_extend 32) (currentByte!12393 (_2!12065 lt!401545))) ((_ sign_extend 32) (currentBit!12388 (_2!12065 lt!401545)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22071 () Bool)

(assert (= bs!22071 d!87122))

(declare-fun m!389029 () Bool)

(assert (=> bs!22071 m!389029))

(assert (=> b!259641 d!87122))

(declare-fun d!87124 () Bool)

(declare-fun e!180246 () Bool)

(assert (=> d!87124 e!180246))

(declare-fun res!217549 () Bool)

(assert (=> d!87124 (=> (not res!217549) (not e!180246))))

(assert (=> d!87124 (= res!217549 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401732 () Unit!18485)

(declare-fun choose!27 (BitStream!11364 BitStream!11364 (_ BitVec 64) (_ BitVec 64)) Unit!18485)

(assert (=> d!87124 (= lt!401732 (choose!27 thiss!1754 (_2!12065 lt!401545) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87124 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12065 lt!401545) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401732)))

(declare-fun b!259741 () Bool)

(assert (=> b!259741 (= e!180246 (validate_offset_bits!1 ((_ sign_extend 32) (size!6221 (buf!6743 (_2!12065 lt!401545)))) ((_ sign_extend 32) (currentByte!12393 (_2!12065 lt!401545))) ((_ sign_extend 32) (currentBit!12388 (_2!12065 lt!401545))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87124 res!217549) b!259741))

(declare-fun m!389033 () Bool)

(assert (=> d!87124 m!389033))

(assert (=> b!259741 m!388941))

(assert (=> b!259641 d!87124))

(check-sat (not d!87106) (not d!87092) (not d!87088) (not b!259735) (not d!87124) (not b!259730) (not b!259741) (not b!259660) (not d!87122) (not b!259727) (not d!87108) (not b!259731) (not d!87112))
