; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55744 () Bool)

(assert start!55744)

(declare-fun b!259211 () Bool)

(declare-fun res!217139 () Bool)

(declare-fun e!179824 () Bool)

(assert (=> b!259211 (=> (not res!217139) (not e!179824))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259211 (= res!217139 (not (= from!526 nBits!535)))))

(declare-fun b!259213 () Bool)

(declare-fun e!179823 () Bool)

(declare-datatypes ((array!14160 0))(
  ( (array!14161 (arr!7189 (Array (_ BitVec 32) (_ BitVec 8))) (size!6202 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11326 0))(
  ( (BitStream!11327 (buf!6724 array!14160) (currentByte!12359 (_ BitVec 32)) (currentBit!12354 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11326)

(declare-fun array_inv!5943 (array!14160) Bool)

(assert (=> b!259213 (= e!179823 (array_inv!5943 (buf!6724 thiss!1754)))))

(declare-fun b!259210 () Bool)

(declare-fun res!217140 () Bool)

(assert (=> b!259210 (=> (not res!217140) (not e!179824))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259210 (= res!217140 (validate_offset_bits!1 ((_ sign_extend 32) (size!6202 (buf!6724 thiss!1754))) ((_ sign_extend 32) (currentByte!12359 thiss!1754)) ((_ sign_extend 32) (currentBit!12354 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22196 0))(
  ( (tuple2!22197 (_1!12034 Bool) (_2!12034 BitStream!11326)) )
))
(declare-fun lt!400991 () tuple2!22196)

(declare-fun b!259212 () Bool)

(assert (=> b!259212 (= e!179824 (and (= (_1!12034 lt!400991) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (not (= (size!6202 (buf!6724 thiss!1754)) (size!6202 (buf!6724 (_2!12034 lt!400991)))))))))

(declare-fun readBit!0 (BitStream!11326) tuple2!22196)

(assert (=> b!259212 (= lt!400991 (readBit!0 thiss!1754))))

(declare-fun res!217141 () Bool)

(assert (=> start!55744 (=> (not res!217141) (not e!179824))))

(assert (=> start!55744 (= res!217141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55744 e!179824))

(assert (=> start!55744 true))

(declare-fun inv!12 (BitStream!11326) Bool)

(assert (=> start!55744 (and (inv!12 thiss!1754) e!179823)))

(assert (= (and start!55744 res!217141) b!259210))

(assert (= (and b!259210 res!217140) b!259211))

(assert (= (and b!259211 res!217139) b!259212))

(assert (= start!55744 b!259213))

(declare-fun m!388517 () Bool)

(assert (=> b!259213 m!388517))

(declare-fun m!388519 () Bool)

(assert (=> b!259210 m!388519))

(declare-fun m!388521 () Bool)

(assert (=> b!259212 m!388521))

(declare-fun m!388523 () Bool)

(assert (=> start!55744 m!388523))

(push 1)

(assert (not start!55744))

(assert (not b!259212))

(assert (not b!259210))

(assert (not b!259213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86970 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86970 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12354 thiss!1754) (currentByte!12359 thiss!1754) (size!6202 (buf!6724 thiss!1754))))))

(declare-fun bs!22026 () Bool)

(assert (= bs!22026 d!86970))

(declare-fun m!388541 () Bool)

(assert (=> bs!22026 m!388541))

(assert (=> start!55744 d!86970))

(declare-fun d!86974 () Bool)

(declare-fun e!179857 () Bool)

(assert (=> d!86974 e!179857))

(declare-fun res!217162 () Bool)

(assert (=> d!86974 (=> (not res!217162) (not e!179857))))

(declare-datatypes ((Unit!18453 0))(
  ( (Unit!18454) )
))
(declare-datatypes ((tuple2!22202 0))(
  ( (tuple2!22203 (_1!12037 Unit!18453) (_2!12037 BitStream!11326)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11326) tuple2!22202)

(assert (=> d!86974 (= res!217162 (= (buf!6724 (_2!12037 (increaseBitIndex!0 thiss!1754))) (buf!6724 thiss!1754)))))

(declare-fun lt!401014 () Bool)

(assert (=> d!86974 (= lt!401014 (not (= (bvand ((_ sign_extend 24) (select (arr!7189 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12354 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401015 () tuple2!22196)

(assert (=> d!86974 (= lt!401015 (tuple2!22197 (not (= (bvand ((_ sign_extend 24) (select (arr!7189 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12354 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12037 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86974 (validate_offset_bit!0 ((_ sign_extend 32) (size!6202 (buf!6724 thiss!1754))) ((_ sign_extend 32) (currentByte!12359 thiss!1754)) ((_ sign_extend 32) (currentBit!12354 thiss!1754)))))

(assert (=> d!86974 (= (readBit!0 thiss!1754) lt!401015)))

(declare-fun b!259240 () Bool)

(declare-fun lt!401016 () (_ BitVec 64))

(declare-fun lt!401017 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259240 (= e!179857 (= (bitIndex!0 (size!6202 (buf!6724 (_2!12037 (increaseBitIndex!0 thiss!1754)))) (currentByte!12359 (_2!12037 (increaseBitIndex!0 thiss!1754))) (currentBit!12354 (_2!12037 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401016 lt!401017)))))

(assert (=> b!259240 (or (not (= (bvand lt!401016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401017 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401016 lt!401017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259240 (= lt!401017 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259240 (= lt!401016 (bitIndex!0 (size!6202 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754) (currentBit!12354 thiss!1754)))))

(declare-fun lt!401013 () Bool)

(assert (=> b!259240 (= lt!401013 (not (= (bvand ((_ sign_extend 24) (select (arr!7189 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12354 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401018 () Bool)

(assert (=> b!259240 (= lt!401018 (not (= (bvand ((_ sign_extend 24) (select (arr!7189 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12354 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401012 () Bool)

(assert (=> b!259240 (= lt!401012 (not (= (bvand ((_ sign_extend 24) (select (arr!7189 (buf!6724 thiss!1754)) (currentByte!12359 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12354 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86974 res!217162) b!259240))

(declare-fun m!388547 () Bool)

(assert (=> d!86974 m!388547))

(declare-fun m!388549 () Bool)

(assert (=> d!86974 m!388549))

(declare-fun m!388551 () Bool)

(assert (=> d!86974 m!388551))

(declare-fun m!388553 () Bool)

(assert (=> d!86974 m!388553))

(assert (=> b!259240 m!388551))

(assert (=> b!259240 m!388549))

(declare-fun m!388555 () Bool)

(assert (=> b!259240 m!388555))

(declare-fun m!388557 () Bool)

(assert (=> b!259240 m!388557))

(assert (=> b!259240 m!388547))

(assert (=> b!259212 d!86974))

(declare-fun d!86984 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86984 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6202 (buf!6724 thiss!1754))) ((_ sign_extend 32) (currentByte!12359 thiss!1754)) ((_ sign_extend 32) (currentBit!12354 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6202 (buf!6724 thiss!1754))) ((_ sign_extend 32) (currentByte!12359 thiss!1754)) ((_ sign_extend 32) (currentBit!12354 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22029 () Bool)

(assert (= bs!22029 d!86984))

(declare-fun m!388559 () Bool)

(assert (=> bs!22029 m!388559))

(assert (=> b!259210 d!86984))

(declare-fun d!86986 () Bool)

(assert (=> d!86986 (= (array_inv!5943 (buf!6724 thiss!1754)) (bvsge (size!6202 (buf!6724 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259213 d!86986))

(push 1)

(assert (not b!259240))

(assert (not d!86974))

(assert (not d!86984))

(assert (not d!86970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

