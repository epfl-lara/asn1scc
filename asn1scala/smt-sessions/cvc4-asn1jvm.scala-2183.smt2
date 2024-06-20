; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55370 () Bool)

(assert start!55370)

(declare-fun b!258205 () Bool)

(declare-fun e!179080 () Bool)

(declare-fun e!179079 () Bool)

(assert (=> b!258205 (= e!179080 e!179079)))

(declare-fun res!216340 () Bool)

(assert (=> b!258205 (=> (not res!216340) (not e!179079))))

(declare-datatypes ((array!14047 0))(
  ( (array!14048 (arr!7146 (Array (_ BitVec 32) (_ BitVec 8))) (size!6159 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11240 0))(
  ( (BitStream!11241 (buf!6681 array!14047) (currentByte!12256 (_ BitVec 32)) (currentBit!12251 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22104 0))(
  ( (tuple2!22105 (_1!11988 Bool) (_2!11988 BitStream!11240)) )
))
(declare-fun lt!399692 () tuple2!22104)

(declare-fun expected!109 () Bool)

(assert (=> b!258205 (= res!216340 (= (_1!11988 lt!399692) expected!109))))

(declare-fun thiss!1754 () BitStream!11240)

(declare-fun readBit!0 (BitStream!11240) tuple2!22104)

(assert (=> b!258205 (= lt!399692 (readBit!0 thiss!1754))))

(declare-fun b!258206 () Bool)

(declare-fun res!216339 () Bool)

(assert (=> b!258206 (=> (not res!216339) (not e!179080))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258206 (= res!216339 (not (= from!526 nBits!535)))))

(declare-fun b!258207 () Bool)

(declare-fun res!216338 () Bool)

(assert (=> b!258207 (=> (not res!216338) (not e!179080))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258207 (= res!216338 (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))) ((_ sign_extend 32) (currentByte!12256 thiss!1754)) ((_ sign_extend 32) (currentBit!12251 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258208 () Bool)

(declare-fun e!179078 () Bool)

(declare-fun array_inv!5900 (array!14047) Bool)

(assert (=> b!258208 (= e!179078 (array_inv!5900 (buf!6681 thiss!1754)))))

(declare-fun res!216337 () Bool)

(assert (=> start!55370 (=> (not res!216337) (not e!179080))))

(assert (=> start!55370 (= res!216337 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55370 e!179080))

(assert (=> start!55370 true))

(declare-fun inv!12 (BitStream!11240) Bool)

(assert (=> start!55370 (and (inv!12 thiss!1754) e!179078)))

(declare-fun b!258209 () Bool)

(declare-fun res!216335 () Bool)

(declare-fun e!179077 () Bool)

(assert (=> b!258209 (=> res!216335 e!179077)))

(declare-fun lt!399690 () tuple2!22104)

(assert (=> b!258209 (= res!216335 (or (not (= (buf!6681 thiss!1754) (buf!6681 (_2!11988 lt!399690)))) (not (_1!11988 lt!399690))))))

(declare-fun b!258210 () Bool)

(assert (=> b!258210 (= e!179079 (not e!179077))))

(declare-fun res!216336 () Bool)

(assert (=> b!258210 (=> res!216336 e!179077)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258210 (= res!216336 (bvslt (bvsub (bvadd (bitIndex!0 (size!6159 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754) (currentBit!12251 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399690))) (currentByte!12256 (_2!11988 lt!399690)) (currentBit!12251 (_2!11988 lt!399690)))))))

(declare-fun checkBitsLoop!0 (BitStream!11240 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22104)

(assert (=> b!258210 (= lt!399690 (checkBitsLoop!0 (_2!11988 lt!399692) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258210 (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399692)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399692))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399692))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18427 0))(
  ( (Unit!18428) )
))
(declare-fun lt!399691 () Unit!18427)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11240 BitStream!11240 (_ BitVec 64) (_ BitVec 64)) Unit!18427)

(assert (=> b!258210 (= lt!399691 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11988 lt!399692) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258211 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258211 (= e!179077 (invariant!0 (currentBit!12251 (_2!11988 lt!399690)) (currentByte!12256 (_2!11988 lt!399690)) (size!6159 (buf!6681 (_2!11988 lt!399690)))))))

(assert (= (and start!55370 res!216337) b!258207))

(assert (= (and b!258207 res!216338) b!258206))

(assert (= (and b!258206 res!216339) b!258205))

(assert (= (and b!258205 res!216340) b!258210))

(assert (= (and b!258210 (not res!216336)) b!258209))

(assert (= (and b!258209 (not res!216335)) b!258211))

(assert (= start!55370 b!258208))

(declare-fun m!387693 () Bool)

(assert (=> b!258205 m!387693))

(declare-fun m!387695 () Bool)

(assert (=> b!258210 m!387695))

(declare-fun m!387697 () Bool)

(assert (=> b!258210 m!387697))

(declare-fun m!387699 () Bool)

(assert (=> b!258210 m!387699))

(declare-fun m!387701 () Bool)

(assert (=> b!258210 m!387701))

(declare-fun m!387703 () Bool)

(assert (=> b!258210 m!387703))

(declare-fun m!387705 () Bool)

(assert (=> b!258211 m!387705))

(declare-fun m!387707 () Bool)

(assert (=> start!55370 m!387707))

(declare-fun m!387709 () Bool)

(assert (=> b!258208 m!387709))

(declare-fun m!387711 () Bool)

(assert (=> b!258207 m!387711))

(push 1)

(assert (not b!258211))

(assert (not b!258208))

(assert (not b!258205))

(assert (not b!258210))

(assert (not b!258207))

(assert (not start!55370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86634 () Bool)

(declare-fun e!179107 () Bool)

(assert (=> d!86634 e!179107))

(declare-fun res!216358 () Bool)

(assert (=> d!86634 (=> (not res!216358) (not e!179107))))

(declare-datatypes ((tuple2!22112 0))(
  ( (tuple2!22113 (_1!11992 Unit!18427) (_2!11992 BitStream!11240)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11240) tuple2!22112)

(assert (=> d!86634 (= res!216358 (= (buf!6681 (_2!11992 (increaseBitIndex!0 thiss!1754))) (buf!6681 thiss!1754)))))

(declare-fun lt!399776 () Bool)

(assert (=> d!86634 (= lt!399776 (not (= (bvand ((_ sign_extend 24) (select (arr!7146 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12251 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399772 () tuple2!22104)

(assert (=> d!86634 (= lt!399772 (tuple2!22105 (not (= (bvand ((_ sign_extend 24) (select (arr!7146 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12251 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11992 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86634 (validate_offset_bit!0 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))) ((_ sign_extend 32) (currentByte!12256 thiss!1754)) ((_ sign_extend 32) (currentBit!12251 thiss!1754)))))

(assert (=> d!86634 (= (readBit!0 thiss!1754) lt!399772)))

(declare-fun b!258229 () Bool)

(declare-fun lt!399771 () (_ BitVec 64))

(declare-fun lt!399775 () (_ BitVec 64))

(assert (=> b!258229 (= e!179107 (= (bitIndex!0 (size!6159 (buf!6681 (_2!11992 (increaseBitIndex!0 thiss!1754)))) (currentByte!12256 (_2!11992 (increaseBitIndex!0 thiss!1754))) (currentBit!12251 (_2!11992 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399771 lt!399775)))))

(assert (=> b!258229 (or (not (= (bvand lt!399771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399775 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399771 lt!399775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258229 (= lt!399775 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258229 (= lt!399771 (bitIndex!0 (size!6159 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754) (currentBit!12251 thiss!1754)))))

(declare-fun lt!399773 () Bool)

(assert (=> b!258229 (= lt!399773 (not (= (bvand ((_ sign_extend 24) (select (arr!7146 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12251 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399774 () Bool)

(assert (=> b!258229 (= lt!399774 (not (= (bvand ((_ sign_extend 24) (select (arr!7146 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12251 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399770 () Bool)

(assert (=> b!258229 (= lt!399770 (not (= (bvand ((_ sign_extend 24) (select (arr!7146 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12251 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86634 res!216358) b!258229))

(declare-fun m!387741 () Bool)

(assert (=> d!86634 m!387741))

(declare-fun m!387743 () Bool)

(assert (=> d!86634 m!387743))

(declare-fun m!387745 () Bool)

(assert (=> d!86634 m!387745))

(declare-fun m!387747 () Bool)

(assert (=> d!86634 m!387747))

(assert (=> b!258229 m!387745))

(declare-fun m!387749 () Bool)

(assert (=> b!258229 m!387749))

(assert (=> b!258229 m!387741))

(assert (=> b!258229 m!387697))

(assert (=> b!258229 m!387743))

(assert (=> b!258205 d!86634))

(declare-fun d!86646 () Bool)

(declare-fun e!179110 () Bool)

(assert (=> d!86646 e!179110))

(declare-fun res!216361 () Bool)

(assert (=> d!86646 (=> (not res!216361) (not e!179110))))

(assert (=> d!86646 (= res!216361 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399779 () Unit!18427)

(declare-fun choose!27 (BitStream!11240 BitStream!11240 (_ BitVec 64) (_ BitVec 64)) Unit!18427)

(assert (=> d!86646 (= lt!399779 (choose!27 thiss!1754 (_2!11988 lt!399692) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86646 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86646 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11988 lt!399692) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399779)))

(declare-fun b!258232 () Bool)

(assert (=> b!258232 (= e!179110 (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399692)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399692))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399692))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86646 res!216361) b!258232))

(declare-fun m!387751 () Bool)

(assert (=> d!86646 m!387751))

(assert (=> b!258232 m!387699))

(assert (=> b!258210 d!86646))

(declare-fun d!86648 () Bool)

(declare-fun e!179113 () Bool)

(assert (=> d!86648 e!179113))

(declare-fun res!216367 () Bool)

(assert (=> d!86648 (=> (not res!216367) (not e!179113))))

(declare-fun lt!399796 () (_ BitVec 64))

(declare-fun lt!399793 () (_ BitVec 64))

(declare-fun lt!399794 () (_ BitVec 64))

(assert (=> d!86648 (= res!216367 (= lt!399794 (bvsub lt!399796 lt!399793)))))

(assert (=> d!86648 (or (= (bvand lt!399796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399796 lt!399793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86648 (= lt!399793 (remainingBits!0 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))) ((_ sign_extend 32) (currentByte!12256 thiss!1754)) ((_ sign_extend 32) (currentBit!12251 thiss!1754))))))

(declare-fun lt!399795 () (_ BitVec 64))

(declare-fun lt!399797 () (_ BitVec 64))

(assert (=> d!86648 (= lt!399796 (bvmul lt!399795 lt!399797))))

(assert (=> d!86648 (or (= lt!399795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399797 (bvsdiv (bvmul lt!399795 lt!399797) lt!399795)))))

(assert (=> d!86648 (= lt!399797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86648 (= lt!399795 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))))))

(assert (=> d!86648 (= lt!399794 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12256 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12251 thiss!1754))))))

(assert (=> d!86648 (invariant!0 (currentBit!12251 thiss!1754) (currentByte!12256 thiss!1754) (size!6159 (buf!6681 thiss!1754)))))

(assert (=> d!86648 (= (bitIndex!0 (size!6159 (buf!6681 thiss!1754)) (currentByte!12256 thiss!1754) (currentBit!12251 thiss!1754)) lt!399794)))

(declare-fun b!258237 () Bool)

(declare-fun res!216366 () Bool)

(assert (=> b!258237 (=> (not res!216366) (not e!179113))))

(assert (=> b!258237 (= res!216366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399794))))

(declare-fun b!258238 () Bool)

(declare-fun lt!399792 () (_ BitVec 64))

(assert (=> b!258238 (= e!179113 (bvsle lt!399794 (bvmul lt!399792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258238 (or (= lt!399792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399792)))))

(assert (=> b!258238 (= lt!399792 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))))))

(assert (= (and d!86648 res!216367) b!258237))

(assert (= (and b!258237 res!216366) b!258238))

(declare-fun m!387753 () Bool)

(assert (=> d!86648 m!387753))

(declare-fun m!387755 () Bool)

(assert (=> d!86648 m!387755))

(assert (=> b!258210 d!86648))

(declare-fun b!258324 () Bool)

(declare-fun res!216425 () Bool)

(declare-fun e!179162 () Bool)

(assert (=> b!258324 (=> (not res!216425) (not e!179162))))

(declare-fun e!179163 () Bool)

(assert (=> b!258324 (= res!216425 e!179163)))

(declare-fun res!216421 () Bool)

(assert (=> b!258324 (=> res!216421 e!179163)))

(declare-fun lt!399929 () tuple2!22104)

(assert (=> b!258324 (= res!216421 (not (_1!11988 lt!399929)))))

(declare-fun b!258325 () Bool)

(declare-fun e!179164 () tuple2!22104)

(declare-fun e!179165 () tuple2!22104)

(assert (=> b!258325 (= e!179164 e!179165)))

(declare-fun lt!399923 () tuple2!22104)

(assert (=> b!258325 (= lt!399923 (readBit!0 (_2!11988 lt!399692)))))

(declare-fun c!11877 () Bool)

(assert (=> b!258325 (= c!11877 (not (= (_1!11988 lt!399923) expected!109)))))

(declare-fun b!258326 () Bool)

(declare-fun e!179166 () Bool)

(declare-datatypes ((tuple2!22116 0))(
  ( (tuple2!22117 (_1!11994 BitStream!11240) (_2!11994 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11240) tuple2!22116)

(assert (=> b!258326 (= e!179166 (= expected!109 (_2!11994 (readBitPure!0 (_2!11988 lt!399692)))))))

(declare-fun b!258327 () Bool)

(assert (=> b!258327 (= e!179162 e!179166)))

(declare-fun res!216423 () Bool)

(assert (=> b!258327 (=> res!216423 e!179166)))

(assert (=> b!258327 (= res!216423 (or (not (_1!11988 lt!399929)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258328 () Bool)

(declare-fun lt!399922 () (_ BitVec 64))

(assert (=> b!258328 (= e!179163 (= (bvsub lt!399922 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399929))) (currentByte!12256 (_2!11988 lt!399929)) (currentBit!12251 (_2!11988 lt!399929)))))))

(assert (=> b!258328 (or (= (bvand lt!399922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399922 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399921 () (_ BitVec 64))

(assert (=> b!258328 (= lt!399922 (bvadd lt!399921 nBits!535))))

(assert (=> b!258328 (or (not (= (bvand lt!399921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399921 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258328 (= lt!399921 (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399692))) (currentByte!12256 (_2!11988 lt!399692)) (currentBit!12251 (_2!11988 lt!399692))))))

(declare-fun b!258329 () Bool)

(assert (=> b!258329 (= e!179164 (tuple2!22105 true (_2!11988 lt!399692)))))

(declare-fun b!258330 () Bool)

(declare-fun res!216422 () Bool)

(assert (=> b!258330 (=> (not res!216422) (not e!179162))))

(assert (=> b!258330 (= res!216422 (and (= (buf!6681 (_2!11988 lt!399692)) (buf!6681 (_2!11988 lt!399929))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11988 lt!399929))))))

(declare-fun d!86650 () Bool)

(assert (=> d!86650 e!179162))

(declare-fun res!216424 () Bool)

(assert (=> d!86650 (=> (not res!216424) (not e!179162))))

(declare-fun lt!399920 () (_ BitVec 64))

(assert (=> d!86650 (= res!216424 (bvsge (bvsub lt!399920 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399929))) (currentByte!12256 (_2!11988 lt!399929)) (currentBit!12251 (_2!11988 lt!399929)))))))

(assert (=> d!86650 (or (= (bvand lt!399920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399920 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399928 () (_ BitVec 64))

(assert (=> d!86650 (= lt!399920 (bvadd lt!399928 nBits!535))))

(assert (=> d!86650 (or (not (= (bvand lt!399928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399928 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86650 (= lt!399928 (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399692))) (currentByte!12256 (_2!11988 lt!399692)) (currentBit!12251 (_2!11988 lt!399692))))))

(assert (=> d!86650 (= lt!399929 e!179164)))

(declare-fun c!11876 () Bool)

(assert (=> d!86650 (= c!11876 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86650 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86650 (= (checkBitsLoop!0 (_2!11988 lt!399692) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399929)))

(declare-fun b!258331 () Bool)

(assert (=> b!258331 (= e!179165 (tuple2!22105 false (_2!11988 lt!399923)))))

(declare-fun b!258332 () Bool)

(declare-fun lt!399927 () tuple2!22104)

(assert (=> b!258332 (= lt!399927 (checkBitsLoop!0 (_2!11988 lt!399923) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399919 () Unit!18427)

(declare-fun lt!399924 () Unit!18427)

(assert (=> b!258332 (= lt!399919 lt!399924)))

(declare-fun lt!399926 () (_ BitVec 64))

(declare-fun lt!399925 () (_ BitVec 64))

(assert (=> b!258332 (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399923)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399923))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399923))) (bvsub lt!399926 lt!399925))))

(assert (=> b!258332 (= lt!399924 (validateOffsetBitsIneqLemma!0 (_2!11988 lt!399692) (_2!11988 lt!399923) lt!399926 lt!399925))))

(assert (=> b!258332 (= lt!399925 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258332 (= lt!399926 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258332 (= e!179165 (tuple2!22105 (_1!11988 lt!399927) (_2!11988 lt!399927)))))

(assert (= (and d!86650 c!11876) b!258329))

(assert (= (and d!86650 (not c!11876)) b!258325))

(assert (= (and b!258325 c!11877) b!258331))

(assert (= (and b!258325 (not c!11877)) b!258332))

(assert (= (and d!86650 res!216424) b!258330))

(assert (= (and b!258330 res!216422) b!258324))

(assert (= (and b!258324 (not res!216421)) b!258328))

(assert (= (and b!258324 res!216425) b!258327))

(assert (= (and b!258327 (not res!216423)) b!258326))

(declare-fun m!387797 () Bool)

(assert (=> b!258326 m!387797))

(declare-fun m!387799 () Bool)

(assert (=> b!258328 m!387799))

(declare-fun m!387801 () Bool)

(assert (=> b!258328 m!387801))

(declare-fun m!387803 () Bool)

(assert (=> b!258325 m!387803))

(assert (=> d!86650 m!387799))

(assert (=> d!86650 m!387801))

(declare-fun m!387805 () Bool)

(assert (=> b!258332 m!387805))

(declare-fun m!387807 () Bool)

(assert (=> b!258332 m!387807))

(declare-fun m!387809 () Bool)

(assert (=> b!258332 m!387809))

(assert (=> b!258210 d!86650))

(declare-fun d!86672 () Bool)

(declare-fun e!179167 () Bool)

(assert (=> d!86672 e!179167))

(declare-fun res!216427 () Bool)

(assert (=> d!86672 (=> (not res!216427) (not e!179167))))

(declare-fun lt!399931 () (_ BitVec 64))

(declare-fun lt!399934 () (_ BitVec 64))

(declare-fun lt!399932 () (_ BitVec 64))

(assert (=> d!86672 (= res!216427 (= lt!399932 (bvsub lt!399934 lt!399931)))))

(assert (=> d!86672 (or (= (bvand lt!399934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399934 lt!399931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86672 (= lt!399931 (remainingBits!0 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399690)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399690))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399690)))))))

(declare-fun lt!399933 () (_ BitVec 64))

(declare-fun lt!399935 () (_ BitVec 64))

(assert (=> d!86672 (= lt!399934 (bvmul lt!399933 lt!399935))))

(assert (=> d!86672 (or (= lt!399933 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399935 (bvsdiv (bvmul lt!399933 lt!399935) lt!399933)))))

(assert (=> d!86672 (= lt!399935 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86672 (= lt!399933 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399690)))))))

(assert (=> d!86672 (= lt!399932 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399690)))))))

(assert (=> d!86672 (invariant!0 (currentBit!12251 (_2!11988 lt!399690)) (currentByte!12256 (_2!11988 lt!399690)) (size!6159 (buf!6681 (_2!11988 lt!399690))))))

(assert (=> d!86672 (= (bitIndex!0 (size!6159 (buf!6681 (_2!11988 lt!399690))) (currentByte!12256 (_2!11988 lt!399690)) (currentBit!12251 (_2!11988 lt!399690))) lt!399932)))

(declare-fun b!258333 () Bool)

(declare-fun res!216426 () Bool)

(assert (=> b!258333 (=> (not res!216426) (not e!179167))))

(assert (=> b!258333 (= res!216426 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399932))))

(declare-fun b!258334 () Bool)

(declare-fun lt!399930 () (_ BitVec 64))

(assert (=> b!258334 (= e!179167 (bvsle lt!399932 (bvmul lt!399930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258334 (or (= lt!399930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399930)))))

(assert (=> b!258334 (= lt!399930 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399690)))))))

(assert (= (and d!86672 res!216427) b!258333))

(assert (= (and b!258333 res!216426) b!258334))

(declare-fun m!387811 () Bool)

(assert (=> d!86672 m!387811))

(assert (=> d!86672 m!387705))

(assert (=> b!258210 d!86672))

(declare-fun d!86674 () Bool)

(assert (=> d!86674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399692)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399692))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399692))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6159 (buf!6681 (_2!11988 lt!399692)))) ((_ sign_extend 32) (currentByte!12256 (_2!11988 lt!399692))) ((_ sign_extend 32) (currentBit!12251 (_2!11988 lt!399692)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21921 () Bool)

(assert (= bs!21921 d!86674))

(declare-fun m!387813 () Bool)

(assert (=> bs!21921 m!387813))

(assert (=> b!258210 d!86674))

(declare-fun d!86676 () Bool)

(assert (=> d!86676 (= (array_inv!5900 (buf!6681 thiss!1754)) (bvsge (size!6159 (buf!6681 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258208 d!86676))

(declare-fun d!86678 () Bool)

(assert (=> d!86678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))) ((_ sign_extend 32) (currentByte!12256 thiss!1754)) ((_ sign_extend 32) (currentBit!12251 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6159 (buf!6681 thiss!1754))) ((_ sign_extend 32) (currentByte!12256 thiss!1754)) ((_ sign_extend 32) (currentBit!12251 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21922 () Bool)

(assert (= bs!21922 d!86678))

(assert (=> bs!21922 m!387753))

(assert (=> b!258207 d!86678))

(declare-fun d!86680 () Bool)

(assert (=> d!86680 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12251 thiss!1754) (currentByte!12256 thiss!1754) (size!6159 (buf!6681 thiss!1754))))))

(declare-fun bs!21923 () Bool)

(assert (= bs!21923 d!86680))

(assert (=> bs!21923 m!387755))

(assert (=> start!55370 d!86680))

(declare-fun d!86682 () Bool)

(assert (=> d!86682 (= (invariant!0 (currentBit!12251 (_2!11988 lt!399690)) (currentByte!12256 (_2!11988 lt!399690)) (size!6159 (buf!6681 (_2!11988 lt!399690)))) (and (bvsge (currentBit!12251 (_2!11988 lt!399690)) #b00000000000000000000000000000000) (bvslt (currentBit!12251 (_2!11988 lt!399690)) #b00000000000000000000000000001000) (bvsge (currentByte!12256 (_2!11988 lt!399690)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12256 (_2!11988 lt!399690)) (size!6159 (buf!6681 (_2!11988 lt!399690)))) (and (= (currentBit!12251 (_2!11988 lt!399690)) #b00000000000000000000000000000000) (= (currentByte!12256 (_2!11988 lt!399690)) (size!6159 (buf!6681 (_2!11988 lt!399690))))))))))

(assert (=> b!258211 d!86682))

(push 1)

