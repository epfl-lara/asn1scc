; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55746 () Bool)

(assert start!55746)

(declare-fun b!259223 () Bool)

(declare-fun res!217148 () Bool)

(declare-fun e!179831 () Bool)

(assert (=> b!259223 (=> (not res!217148) (not e!179831))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259223 (= res!217148 (not (= from!526 nBits!535)))))

(declare-fun res!217150 () Bool)

(assert (=> start!55746 (=> (not res!217150) (not e!179831))))

(assert (=> start!55746 (= res!217150 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55746 e!179831))

(assert (=> start!55746 true))

(declare-datatypes ((array!14162 0))(
  ( (array!14163 (arr!7190 (Array (_ BitVec 32) (_ BitVec 8))) (size!6203 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11328 0))(
  ( (BitStream!11329 (buf!6725 array!14162) (currentByte!12360 (_ BitVec 32)) (currentBit!12355 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11328)

(declare-fun e!179832 () Bool)

(declare-fun inv!12 (BitStream!11328) Bool)

(assert (=> start!55746 (and (inv!12 thiss!1754) e!179832)))

(declare-fun b!259222 () Bool)

(declare-fun res!217149 () Bool)

(assert (=> b!259222 (=> (not res!217149) (not e!179831))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259222 (= res!217149 (validate_offset_bits!1 ((_ sign_extend 32) (size!6203 (buf!6725 thiss!1754))) ((_ sign_extend 32) (currentByte!12360 thiss!1754)) ((_ sign_extend 32) (currentBit!12355 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22198 0))(
  ( (tuple2!22199 (_1!12035 Bool) (_2!12035 BitStream!11328)) )
))
(declare-fun lt!400994 () tuple2!22198)

(declare-fun b!259224 () Bool)

(assert (=> b!259224 (= e!179831 (and (= (_1!12035 lt!400994) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (not (= (size!6203 (buf!6725 thiss!1754)) (size!6203 (buf!6725 (_2!12035 lt!400994)))))))))

(declare-fun readBit!0 (BitStream!11328) tuple2!22198)

(assert (=> b!259224 (= lt!400994 (readBit!0 thiss!1754))))

(declare-fun b!259225 () Bool)

(declare-fun array_inv!5944 (array!14162) Bool)

(assert (=> b!259225 (= e!179832 (array_inv!5944 (buf!6725 thiss!1754)))))

(assert (= (and start!55746 res!217150) b!259222))

(assert (= (and b!259222 res!217149) b!259223))

(assert (= (and b!259223 res!217148) b!259224))

(assert (= start!55746 b!259225))

(declare-fun m!388525 () Bool)

(assert (=> start!55746 m!388525))

(declare-fun m!388527 () Bool)

(assert (=> b!259222 m!388527))

(declare-fun m!388529 () Bool)

(assert (=> b!259224 m!388529))

(declare-fun m!388531 () Bool)

(assert (=> b!259225 m!388531))

(check-sat (not b!259225) (not b!259224) (not start!55746) (not b!259222))
(check-sat)
(get-model)

(declare-fun d!86968 () Bool)

(assert (=> d!86968 (= (array_inv!5944 (buf!6725 thiss!1754)) (bvsge (size!6203 (buf!6725 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259225 d!86968))

(declare-fun d!86972 () Bool)

(declare-fun e!179862 () Bool)

(assert (=> d!86972 e!179862))

(declare-fun res!217167 () Bool)

(assert (=> d!86972 (=> (not res!217167) (not e!179862))))

(declare-datatypes ((Unit!18455 0))(
  ( (Unit!18456) )
))
(declare-datatypes ((tuple2!22204 0))(
  ( (tuple2!22205 (_1!12038 Unit!18455) (_2!12038 BitStream!11328)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11328) tuple2!22204)

(assert (=> d!86972 (= res!217167 (= (buf!6725 (_2!12038 (increaseBitIndex!0 thiss!1754))) (buf!6725 thiss!1754)))))

(declare-fun lt!401052 () Bool)

(assert (=> d!86972 (= lt!401052 (not (= (bvand ((_ sign_extend 24) (select (arr!7190 (buf!6725 thiss!1754)) (currentByte!12360 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12355 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401047 () tuple2!22198)

(assert (=> d!86972 (= lt!401047 (tuple2!22199 (not (= (bvand ((_ sign_extend 24) (select (arr!7190 (buf!6725 thiss!1754)) (currentByte!12360 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12355 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12038 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86972 (validate_offset_bit!0 ((_ sign_extend 32) (size!6203 (buf!6725 thiss!1754))) ((_ sign_extend 32) (currentByte!12360 thiss!1754)) ((_ sign_extend 32) (currentBit!12355 thiss!1754)))))

(assert (=> d!86972 (= (readBit!0 thiss!1754) lt!401047)))

(declare-fun lt!401049 () (_ BitVec 64))

(declare-fun b!259245 () Bool)

(declare-fun lt!401050 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259245 (= e!179862 (= (bitIndex!0 (size!6203 (buf!6725 (_2!12038 (increaseBitIndex!0 thiss!1754)))) (currentByte!12360 (_2!12038 (increaseBitIndex!0 thiss!1754))) (currentBit!12355 (_2!12038 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401049 lt!401050)))))

(assert (=> b!259245 (or (not (= (bvand lt!401049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401050 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401049 lt!401050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259245 (= lt!401050 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259245 (= lt!401049 (bitIndex!0 (size!6203 (buf!6725 thiss!1754)) (currentByte!12360 thiss!1754) (currentBit!12355 thiss!1754)))))

(declare-fun lt!401053 () Bool)

(assert (=> b!259245 (= lt!401053 (not (= (bvand ((_ sign_extend 24) (select (arr!7190 (buf!6725 thiss!1754)) (currentByte!12360 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12355 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401051 () Bool)

(assert (=> b!259245 (= lt!401051 (not (= (bvand ((_ sign_extend 24) (select (arr!7190 (buf!6725 thiss!1754)) (currentByte!12360 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12355 thiss!1754)))) #b00000000000000000000000000000000)))))

