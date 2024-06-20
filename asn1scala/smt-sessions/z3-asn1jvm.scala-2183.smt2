; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55368 () Bool)

(assert start!55368)

(declare-fun b!258184 () Bool)

(declare-fun res!216318 () Bool)

(declare-fun e!179065 () Bool)

(assert (=> b!258184 (=> (not res!216318) (not e!179065))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258184 (= res!216318 (not (= from!526 nBits!535)))))

(declare-fun b!258185 () Bool)

(declare-fun res!216321 () Bool)

(assert (=> b!258185 (=> (not res!216321) (not e!179065))))

(declare-datatypes ((array!14045 0))(
  ( (array!14046 (arr!7145 (Array (_ BitVec 32) (_ BitVec 8))) (size!6158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11238 0))(
  ( (BitStream!11239 (buf!6680 array!14045) (currentByte!12255 (_ BitVec 32)) (currentBit!12250 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11238)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258185 (= res!216321 (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))) ((_ sign_extend 32) (currentByte!12255 thiss!1754)) ((_ sign_extend 32) (currentBit!12250 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258186 () Bool)

(declare-fun e!179061 () Bool)

(declare-fun e!179063 () Bool)

(assert (=> b!258186 (= e!179061 (not e!179063))))

(declare-fun res!216317 () Bool)

(assert (=> b!258186 (=> res!216317 e!179063)))

(declare-datatypes ((tuple2!22102 0))(
  ( (tuple2!22103 (_1!11987 Bool) (_2!11987 BitStream!11238)) )
))
(declare-fun lt!399681 () tuple2!22102)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258186 (= res!216317 (bvslt (bvsub (bvadd (bitIndex!0 (size!6158 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754) (currentBit!12250 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399681))) (currentByte!12255 (_2!11987 lt!399681)) (currentBit!12250 (_2!11987 lt!399681)))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399682 () tuple2!22102)

(declare-fun checkBitsLoop!0 (BitStream!11238 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22102)

(assert (=> b!258186 (= lt!399681 (checkBitsLoop!0 (_2!11987 lt!399682) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258186 (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399682)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399682))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399682))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18425 0))(
  ( (Unit!18426) )
))
(declare-fun lt!399683 () Unit!18425)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11238 BitStream!11238 (_ BitVec 64) (_ BitVec 64)) Unit!18425)

(assert (=> b!258186 (= lt!399683 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11987 lt!399682) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!216320 () Bool)

(assert (=> start!55368 (=> (not res!216320) (not e!179065))))

(assert (=> start!55368 (= res!216320 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55368 e!179065))

(assert (=> start!55368 true))

(declare-fun e!179064 () Bool)

(declare-fun inv!12 (BitStream!11238) Bool)

(assert (=> start!55368 (and (inv!12 thiss!1754) e!179064)))

(declare-fun b!258187 () Bool)

(assert (=> b!258187 (= e!179065 e!179061)))

(declare-fun res!216319 () Bool)

(assert (=> b!258187 (=> (not res!216319) (not e!179061))))

(assert (=> b!258187 (= res!216319 (= (_1!11987 lt!399682) expected!109))))

(declare-fun readBit!0 (BitStream!11238) tuple2!22102)

(assert (=> b!258187 (= lt!399682 (readBit!0 thiss!1754))))

(declare-fun b!258188 () Bool)

(declare-fun res!216322 () Bool)

(assert (=> b!258188 (=> res!216322 e!179063)))

(assert (=> b!258188 (= res!216322 (or (not (= (buf!6680 thiss!1754) (buf!6680 (_2!11987 lt!399681)))) (not (_1!11987 lt!399681))))))

(declare-fun b!258189 () Bool)

(declare-fun array_inv!5899 (array!14045) Bool)

(assert (=> b!258189 (= e!179064 (array_inv!5899 (buf!6680 thiss!1754)))))

(declare-fun b!258190 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258190 (= e!179063 (invariant!0 (currentBit!12250 (_2!11987 lt!399681)) (currentByte!12255 (_2!11987 lt!399681)) (size!6158 (buf!6680 (_2!11987 lt!399681)))))))

(assert (= (and start!55368 res!216320) b!258185))

(assert (= (and b!258185 res!216321) b!258184))

(assert (= (and b!258184 res!216318) b!258187))

(assert (= (and b!258187 res!216319) b!258186))

(assert (= (and b!258186 (not res!216317)) b!258188))

(assert (= (and b!258188 (not res!216322)) b!258190))

(assert (= start!55368 b!258189))

(declare-fun m!387673 () Bool)

(assert (=> start!55368 m!387673))

(declare-fun m!387675 () Bool)

(assert (=> b!258186 m!387675))

(declare-fun m!387677 () Bool)

(assert (=> b!258186 m!387677))

(declare-fun m!387679 () Bool)

(assert (=> b!258186 m!387679))

(declare-fun m!387681 () Bool)

(assert (=> b!258186 m!387681))

(declare-fun m!387683 () Bool)

(assert (=> b!258186 m!387683))

(declare-fun m!387685 () Bool)

(assert (=> b!258185 m!387685))

(declare-fun m!387687 () Bool)

(assert (=> b!258189 m!387687))

(declare-fun m!387689 () Bool)

(assert (=> b!258190 m!387689))

(declare-fun m!387691 () Bool)

(assert (=> b!258187 m!387691))

(check-sat (not b!258186) (not b!258187) (not b!258190) (not start!55368) (not b!258189) (not b!258185))
(check-sat)
(get-model)

(declare-fun d!86624 () Bool)

(assert (=> d!86624 (= (array_inv!5899 (buf!6680 thiss!1754)) (bvsge (size!6158 (buf!6680 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258189 d!86624))

(declare-fun d!86626 () Bool)

(declare-fun e!179087 () Bool)

(assert (=> d!86626 e!179087))

(declare-fun res!216343 () Bool)

(assert (=> d!86626 (=> (not res!216343) (not e!179087))))

(declare-datatypes ((tuple2!22106 0))(
  ( (tuple2!22107 (_1!11989 Unit!18425) (_2!11989 BitStream!11238)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11238) tuple2!22106)

(assert (=> d!86626 (= res!216343 (= (buf!6680 (_2!11989 (increaseBitIndex!0 thiss!1754))) (buf!6680 thiss!1754)))))

(declare-fun lt!399711 () Bool)

(assert (=> d!86626 (= lt!399711 (not (= (bvand ((_ sign_extend 24) (select (arr!7145 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12250 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399713 () tuple2!22102)

(assert (=> d!86626 (= lt!399713 (tuple2!22103 (not (= (bvand ((_ sign_extend 24) (select (arr!7145 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12250 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11989 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86626 (validate_offset_bit!0 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))) ((_ sign_extend 32) (currentByte!12255 thiss!1754)) ((_ sign_extend 32) (currentBit!12250 thiss!1754)))))

(assert (=> d!86626 (= (readBit!0 thiss!1754) lt!399713)))

(declare-fun lt!399709 () (_ BitVec 64))

(declare-fun lt!399712 () (_ BitVec 64))

(declare-fun b!258214 () Bool)

(assert (=> b!258214 (= e!179087 (= (bitIndex!0 (size!6158 (buf!6680 (_2!11989 (increaseBitIndex!0 thiss!1754)))) (currentByte!12255 (_2!11989 (increaseBitIndex!0 thiss!1754))) (currentBit!12250 (_2!11989 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399709 lt!399712)))))

(assert (=> b!258214 (or (not (= (bvand lt!399709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399712 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399709 lt!399712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258214 (= lt!399712 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258214 (= lt!399709 (bitIndex!0 (size!6158 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754) (currentBit!12250 thiss!1754)))))

(declare-fun lt!399708 () Bool)

(assert (=> b!258214 (= lt!399708 (not (= (bvand ((_ sign_extend 24) (select (arr!7145 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12250 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399710 () Bool)

(assert (=> b!258214 (= lt!399710 (not (= (bvand ((_ sign_extend 24) (select (arr!7145 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12250 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399707 () Bool)

(assert (=> b!258214 (= lt!399707 (not (= (bvand ((_ sign_extend 24) (select (arr!7145 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12250 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86626 res!216343) b!258214))

(declare-fun m!387713 () Bool)

(assert (=> d!86626 m!387713))

(declare-fun m!387715 () Bool)

(assert (=> d!86626 m!387715))

(declare-fun m!387717 () Bool)

(assert (=> d!86626 m!387717))

(declare-fun m!387719 () Bool)

(assert (=> d!86626 m!387719))

(assert (=> b!258214 m!387717))

(declare-fun m!387721 () Bool)

(assert (=> b!258214 m!387721))

(assert (=> b!258214 m!387715))

(assert (=> b!258214 m!387713))

(assert (=> b!258214 m!387679))

(assert (=> b!258187 d!86626))

(declare-fun d!86630 () Bool)

(assert (=> d!86630 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12250 thiss!1754) (currentByte!12255 thiss!1754) (size!6158 (buf!6680 thiss!1754))))))

(declare-fun bs!21915 () Bool)

(assert (= bs!21915 d!86630))

(declare-fun m!387723 () Bool)

(assert (=> bs!21915 m!387723))

(assert (=> start!55368 d!86630))

(declare-fun d!86632 () Bool)

(declare-fun e!179099 () Bool)

(assert (=> d!86632 e!179099))

(declare-fun res!216351 () Bool)

(assert (=> d!86632 (=> (not res!216351) (not e!179099))))

(declare-fun lt!399740 () (_ BitVec 64))

(declare-fun lt!399744 () (_ BitVec 64))

(declare-fun lt!399742 () (_ BitVec 64))

(assert (=> d!86632 (= res!216351 (= lt!399740 (bvsub lt!399742 lt!399744)))))

(assert (=> d!86632 (or (= (bvand lt!399742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399742 lt!399744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86632 (= lt!399744 (remainingBits!0 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))) ((_ sign_extend 32) (currentByte!12255 thiss!1754)) ((_ sign_extend 32) (currentBit!12250 thiss!1754))))))

(declare-fun lt!399745 () (_ BitVec 64))

(declare-fun lt!399743 () (_ BitVec 64))

(assert (=> d!86632 (= lt!399742 (bvmul lt!399745 lt!399743))))

(assert (=> d!86632 (or (= lt!399745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399743 (bvsdiv (bvmul lt!399745 lt!399743) lt!399745)))))

(assert (=> d!86632 (= lt!399743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86632 (= lt!399745 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))))))

(assert (=> d!86632 (= lt!399740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12255 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12250 thiss!1754))))))

(assert (=> d!86632 (invariant!0 (currentBit!12250 thiss!1754) (currentByte!12255 thiss!1754) (size!6158 (buf!6680 thiss!1754)))))

(assert (=> d!86632 (= (bitIndex!0 (size!6158 (buf!6680 thiss!1754)) (currentByte!12255 thiss!1754) (currentBit!12250 thiss!1754)) lt!399740)))

(declare-fun b!258221 () Bool)

(declare-fun res!216350 () Bool)

(assert (=> b!258221 (=> (not res!216350) (not e!179099))))

(assert (=> b!258221 (= res!216350 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399740))))

(declare-fun b!258222 () Bool)

(declare-fun lt!399741 () (_ BitVec 64))

(assert (=> b!258222 (= e!179099 (bvsle lt!399740 (bvmul lt!399741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258222 (or (= lt!399741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399741)))))

(assert (=> b!258222 (= lt!399741 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))))))

(assert (= (and d!86632 res!216351) b!258221))

(assert (= (and b!258221 res!216350) b!258222))

(declare-fun m!387725 () Bool)

(assert (=> d!86632 m!387725))

(assert (=> d!86632 m!387723))

(assert (=> b!258186 d!86632))

(declare-fun d!86636 () Bool)

(declare-fun e!179104 () Bool)

(assert (=> d!86636 e!179104))

(declare-fun res!216355 () Bool)

(assert (=> d!86636 (=> (not res!216355) (not e!179104))))

(assert (=> d!86636 (= res!216355 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399755 () Unit!18425)

(declare-fun choose!27 (BitStream!11238 BitStream!11238 (_ BitVec 64) (_ BitVec 64)) Unit!18425)

(assert (=> d!86636 (= lt!399755 (choose!27 thiss!1754 (_2!11987 lt!399682) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86636 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86636 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11987 lt!399682) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399755)))

(declare-fun b!258226 () Bool)

(assert (=> b!258226 (= e!179104 (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399682)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399682))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399682))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86636 res!216355) b!258226))

(declare-fun m!387737 () Bool)

(assert (=> d!86636 m!387737))

(assert (=> b!258226 m!387675))

(assert (=> b!258186 d!86636))

(declare-fun d!86642 () Bool)

(assert (=> d!86642 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399682)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399682))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399682))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399682)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399682))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399682)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21916 () Bool)

(assert (= bs!21916 d!86642))

(declare-fun m!387739 () Bool)

(assert (=> bs!21916 m!387739))

(assert (=> b!258186 d!86642))

(declare-fun b!258284 () Bool)

(declare-fun e!179141 () Bool)

(declare-fun e!179140 () Bool)

(assert (=> b!258284 (= e!179141 e!179140)))

(declare-fun res!216397 () Bool)

(assert (=> b!258284 (=> res!216397 e!179140)))

(declare-fun lt!399863 () tuple2!22102)

(assert (=> b!258284 (= res!216397 (or (not (_1!11987 lt!399863)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258285 () Bool)

(declare-fun e!179139 () tuple2!22102)

(declare-fun e!179143 () tuple2!22102)

(assert (=> b!258285 (= e!179139 e!179143)))

(declare-fun lt!399855 () tuple2!22102)

(assert (=> b!258285 (= lt!399855 (readBit!0 (_2!11987 lt!399682)))))

(declare-fun c!11870 () Bool)

(assert (=> b!258285 (= c!11870 (not (= (_1!11987 lt!399855) expected!109)))))

(declare-fun b!258286 () Bool)

(declare-fun res!216395 () Bool)

(assert (=> b!258286 (=> (not res!216395) (not e!179141))))

(declare-fun e!179142 () Bool)

(assert (=> b!258286 (= res!216395 e!179142)))

(declare-fun res!216396 () Bool)

(assert (=> b!258286 (=> res!216396 e!179142)))

(assert (=> b!258286 (= res!216396 (not (_1!11987 lt!399863)))))

(declare-fun b!258287 () Bool)

(declare-fun res!216394 () Bool)

(assert (=> b!258287 (=> (not res!216394) (not e!179141))))

(assert (=> b!258287 (= res!216394 (and (= (buf!6680 (_2!11987 lt!399682)) (buf!6680 (_2!11987 lt!399863))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11987 lt!399863))))))

(declare-fun b!258288 () Bool)

(assert (=> b!258288 (= e!179143 (tuple2!22103 false (_2!11987 lt!399855)))))

(declare-fun b!258289 () Bool)

(assert (=> b!258289 (= e!179139 (tuple2!22103 true (_2!11987 lt!399682)))))

(declare-fun b!258290 () Bool)

(declare-datatypes ((tuple2!22110 0))(
  ( (tuple2!22111 (_1!11991 BitStream!11238) (_2!11991 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11238) tuple2!22110)

(assert (=> b!258290 (= e!179140 (= expected!109 (_2!11991 (readBitPure!0 (_2!11987 lt!399682)))))))

(declare-fun d!86644 () Bool)

(assert (=> d!86644 e!179141))

(declare-fun res!216393 () Bool)

(assert (=> d!86644 (=> (not res!216393) (not e!179141))))

(declare-fun lt!399853 () (_ BitVec 64))

(assert (=> d!86644 (= res!216393 (bvsge (bvsub lt!399853 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399863))) (currentByte!12255 (_2!11987 lt!399863)) (currentBit!12250 (_2!11987 lt!399863)))))))

(assert (=> d!86644 (or (= (bvand lt!399853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399853 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399860 () (_ BitVec 64))

(assert (=> d!86644 (= lt!399853 (bvadd lt!399860 nBits!535))))

(assert (=> d!86644 (or (not (= (bvand lt!399860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399860 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86644 (= lt!399860 (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399682))) (currentByte!12255 (_2!11987 lt!399682)) (currentBit!12250 (_2!11987 lt!399682))))))

(assert (=> d!86644 (= lt!399863 e!179139)))

(declare-fun c!11871 () Bool)

(assert (=> d!86644 (= c!11871 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86644 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86644 (= (checkBitsLoop!0 (_2!11987 lt!399682) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399863)))

(declare-fun lt!399856 () (_ BitVec 64))

(declare-fun b!258291 () Bool)

(assert (=> b!258291 (= e!179142 (= (bvsub lt!399856 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399863))) (currentByte!12255 (_2!11987 lt!399863)) (currentBit!12250 (_2!11987 lt!399863)))))))

(assert (=> b!258291 (or (= (bvand lt!399856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399856 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399861 () (_ BitVec 64))

(assert (=> b!258291 (= lt!399856 (bvadd lt!399861 nBits!535))))

(assert (=> b!258291 (or (not (= (bvand lt!399861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399861 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258291 (= lt!399861 (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399682))) (currentByte!12255 (_2!11987 lt!399682)) (currentBit!12250 (_2!11987 lt!399682))))))

(declare-fun b!258292 () Bool)

(declare-fun lt!399854 () tuple2!22102)

(assert (=> b!258292 (= lt!399854 (checkBitsLoop!0 (_2!11987 lt!399855) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399859 () Unit!18425)

(declare-fun lt!399857 () Unit!18425)

(assert (=> b!258292 (= lt!399859 lt!399857)))

(declare-fun lt!399858 () (_ BitVec 64))

(declare-fun lt!399862 () (_ BitVec 64))

(assert (=> b!258292 (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399855)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399855))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399855))) (bvsub lt!399858 lt!399862))))

(assert (=> b!258292 (= lt!399857 (validateOffsetBitsIneqLemma!0 (_2!11987 lt!399682) (_2!11987 lt!399855) lt!399858 lt!399862))))

(assert (=> b!258292 (= lt!399862 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258292 (= lt!399858 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258292 (= e!179143 (tuple2!22103 (_1!11987 lt!399854) (_2!11987 lt!399854)))))

(assert (= (and d!86644 c!11871) b!258289))

(assert (= (and d!86644 (not c!11871)) b!258285))

(assert (= (and b!258285 c!11870) b!258288))

(assert (= (and b!258285 (not c!11870)) b!258292))

(assert (= (and d!86644 res!216393) b!258287))

(assert (= (and b!258287 res!216394) b!258286))

(assert (= (and b!258286 (not res!216396)) b!258291))

(assert (= (and b!258286 res!216395) b!258284))

(assert (= (and b!258284 (not res!216397)) b!258290))

(declare-fun m!387771 () Bool)

(assert (=> b!258290 m!387771))

(declare-fun m!387773 () Bool)

(assert (=> b!258285 m!387773))

(declare-fun m!387775 () Bool)

(assert (=> d!86644 m!387775))

(declare-fun m!387777 () Bool)

(assert (=> d!86644 m!387777))

(assert (=> b!258291 m!387775))

(assert (=> b!258291 m!387777))

(declare-fun m!387779 () Bool)

(assert (=> b!258292 m!387779))

(declare-fun m!387781 () Bool)

(assert (=> b!258292 m!387781))

(declare-fun m!387783 () Bool)

(assert (=> b!258292 m!387783))

(assert (=> b!258186 d!86644))

(declare-fun d!86654 () Bool)

(declare-fun e!179144 () Bool)

(assert (=> d!86654 e!179144))

(declare-fun res!216399 () Bool)

(assert (=> d!86654 (=> (not res!216399) (not e!179144))))

(declare-fun lt!399866 () (_ BitVec 64))

(declare-fun lt!399868 () (_ BitVec 64))

(declare-fun lt!399864 () (_ BitVec 64))

(assert (=> d!86654 (= res!216399 (= lt!399864 (bvsub lt!399866 lt!399868)))))

(assert (=> d!86654 (or (= (bvand lt!399866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399866 lt!399868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86654 (= lt!399868 (remainingBits!0 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399681)))) ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399681))) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399681)))))))

(declare-fun lt!399869 () (_ BitVec 64))

(declare-fun lt!399867 () (_ BitVec 64))

(assert (=> d!86654 (= lt!399866 (bvmul lt!399869 lt!399867))))

(assert (=> d!86654 (or (= lt!399869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399867 (bvsdiv (bvmul lt!399869 lt!399867) lt!399869)))))

(assert (=> d!86654 (= lt!399867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86654 (= lt!399869 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399681)))))))

(assert (=> d!86654 (= lt!399864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12255 (_2!11987 lt!399681))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12250 (_2!11987 lt!399681)))))))

(assert (=> d!86654 (invariant!0 (currentBit!12250 (_2!11987 lt!399681)) (currentByte!12255 (_2!11987 lt!399681)) (size!6158 (buf!6680 (_2!11987 lt!399681))))))

(assert (=> d!86654 (= (bitIndex!0 (size!6158 (buf!6680 (_2!11987 lt!399681))) (currentByte!12255 (_2!11987 lt!399681)) (currentBit!12250 (_2!11987 lt!399681))) lt!399864)))

(declare-fun b!258293 () Bool)

(declare-fun res!216398 () Bool)

(assert (=> b!258293 (=> (not res!216398) (not e!179144))))

(assert (=> b!258293 (= res!216398 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399864))))

(declare-fun b!258294 () Bool)

(declare-fun lt!399865 () (_ BitVec 64))

(assert (=> b!258294 (= e!179144 (bvsle lt!399864 (bvmul lt!399865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258294 (or (= lt!399865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399865)))))

(assert (=> b!258294 (= lt!399865 ((_ sign_extend 32) (size!6158 (buf!6680 (_2!11987 lt!399681)))))))

(assert (= (and d!86654 res!216399) b!258293))

(assert (= (and b!258293 res!216398) b!258294))

(declare-fun m!387785 () Bool)

(assert (=> d!86654 m!387785))

(assert (=> d!86654 m!387689))

(assert (=> b!258186 d!86654))

(declare-fun d!86656 () Bool)

(assert (=> d!86656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))) ((_ sign_extend 32) (currentByte!12255 thiss!1754)) ((_ sign_extend 32) (currentBit!12250 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6158 (buf!6680 thiss!1754))) ((_ sign_extend 32) (currentByte!12255 thiss!1754)) ((_ sign_extend 32) (currentBit!12250 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21917 () Bool)

(assert (= bs!21917 d!86656))

(assert (=> bs!21917 m!387725))

(assert (=> b!258185 d!86656))

(declare-fun d!86658 () Bool)

(assert (=> d!86658 (= (invariant!0 (currentBit!12250 (_2!11987 lt!399681)) (currentByte!12255 (_2!11987 lt!399681)) (size!6158 (buf!6680 (_2!11987 lt!399681)))) (and (bvsge (currentBit!12250 (_2!11987 lt!399681)) #b00000000000000000000000000000000) (bvslt (currentBit!12250 (_2!11987 lt!399681)) #b00000000000000000000000000001000) (bvsge (currentByte!12255 (_2!11987 lt!399681)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12255 (_2!11987 lt!399681)) (size!6158 (buf!6680 (_2!11987 lt!399681)))) (and (= (currentBit!12250 (_2!11987 lt!399681)) #b00000000000000000000000000000000) (= (currentByte!12255 (_2!11987 lt!399681)) (size!6158 (buf!6680 (_2!11987 lt!399681))))))))))

(assert (=> b!258190 d!86658))

(check-sat (not d!86626) (not d!86642) (not b!258285) (not b!258214) (not b!258226) (not d!86654) (not d!86632) (not d!86656) (not d!86636) (not b!258292) (not d!86630) (not d!86644) (not b!258290) (not b!258291))
