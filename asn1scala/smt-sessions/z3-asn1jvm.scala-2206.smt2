; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55926 () Bool)

(assert start!55926)

(declare-fun b!259805 () Bool)

(declare-fun e!180299 () Bool)

(declare-fun e!180300 () Bool)

(assert (=> b!259805 (= e!180299 (not e!180300))))

(declare-fun res!217598 () Bool)

(assert (=> b!259805 (=> res!217598 e!180300)))

(declare-fun lt!401819 () (_ BitVec 64))

(declare-datatypes ((array!14216 0))(
  ( (array!14217 (arr!7211 (Array (_ BitVec 32) (_ BitVec 8))) (size!6224 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11370 0))(
  ( (BitStream!11371 (buf!6746 array!14216) (currentByte!12402 (_ BitVec 32)) (currentBit!12397 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22276 0))(
  ( (tuple2!22277 (_1!12074 Bool) (_2!12074 BitStream!11370)) )
))
(declare-fun lt!401817 () tuple2!22276)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259805 (= res!217598 (bvslt (bvsub lt!401819 from!526) (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401817))) (currentByte!12402 (_2!12074 lt!401817)) (currentBit!12397 (_2!12074 lt!401817)))))))

(declare-fun lt!401816 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259805 (= lt!401819 (bvadd lt!401816 nBits!535))))

(declare-fun thiss!1754 () BitStream!11370)

(assert (=> b!259805 (= lt!401816 (bitIndex!0 (size!6224 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754) (currentBit!12397 thiss!1754)))))

(declare-fun expected!109 () Bool)

(declare-fun lt!401815 () tuple2!22276)

(declare-fun checkBitsLoop!0 (BitStream!11370 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22276)

(assert (=> b!259805 (= lt!401817 (checkBitsLoop!0 (_2!12074 lt!401815) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259805 (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401815)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401815))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401815))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18491 0))(
  ( (Unit!18492) )
))
(declare-fun lt!401818 () Unit!18491)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11370 BitStream!11370 (_ BitVec 64) (_ BitVec 64)) Unit!18491)

(assert (=> b!259805 (= lt!401818 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12074 lt!401815) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259806 () Bool)

(declare-fun res!217597 () Bool)

(declare-fun e!180301 () Bool)

(assert (=> b!259806 (=> (not res!217597) (not e!180301))))

(assert (=> b!259806 (= res!217597 (not (= from!526 nBits!535)))))

(declare-fun b!259807 () Bool)

(declare-fun res!217596 () Bool)

(assert (=> b!259807 (=> (not res!217596) (not e!180301))))

(assert (=> b!259807 (= res!217596 (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))) ((_ sign_extend 32) (currentByte!12402 thiss!1754)) ((_ sign_extend 32) (currentBit!12397 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259808 () Bool)

(assert (=> b!259808 (= e!180301 e!180299)))

(declare-fun res!217599 () Bool)

(assert (=> b!259808 (=> (not res!217599) (not e!180299))))

(assert (=> b!259808 (= res!217599 (= (_1!12074 lt!401815) expected!109))))

(declare-fun readBit!0 (BitStream!11370) tuple2!22276)

(assert (=> b!259808 (= lt!401815 (readBit!0 thiss!1754))))

(declare-fun b!259810 () Bool)

(assert (=> b!259810 (= e!180300 (or (not (= (buf!6746 thiss!1754) (buf!6746 (_2!12074 lt!401817)))) (not (_1!12074 lt!401817)) (let ((bdg!16202 (bvand lt!401816 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!16202 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!16202 (bvand lt!401819 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!259809 () Bool)

(declare-fun e!180298 () Bool)

(declare-fun array_inv!5965 (array!14216) Bool)

(assert (=> b!259809 (= e!180298 (array_inv!5965 (buf!6746 thiss!1754)))))

(declare-fun res!217600 () Bool)

(assert (=> start!55926 (=> (not res!217600) (not e!180301))))

(assert (=> start!55926 (= res!217600 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55926 e!180301))

(assert (=> start!55926 true))

(declare-fun inv!12 (BitStream!11370) Bool)

(assert (=> start!55926 (and (inv!12 thiss!1754) e!180298)))

(assert (= (and start!55926 res!217600) b!259807))

(assert (= (and b!259807 res!217596) b!259806))

(assert (= (and b!259806 res!217597) b!259808))

(assert (= (and b!259808 res!217599) b!259805))

(assert (= (and b!259805 (not res!217598)) b!259810))

(assert (= start!55926 b!259809))

(declare-fun m!389081 () Bool)

(assert (=> b!259809 m!389081))

(declare-fun m!389083 () Bool)

(assert (=> b!259808 m!389083))

(declare-fun m!389085 () Bool)

(assert (=> b!259807 m!389085))

(declare-fun m!389087 () Bool)

(assert (=> start!55926 m!389087))

(declare-fun m!389089 () Bool)

(assert (=> b!259805 m!389089))

(declare-fun m!389091 () Bool)

(assert (=> b!259805 m!389091))

(declare-fun m!389093 () Bool)

(assert (=> b!259805 m!389093))

(declare-fun m!389095 () Bool)

(assert (=> b!259805 m!389095))

(declare-fun m!389097 () Bool)

(assert (=> b!259805 m!389097))

(check-sat (not b!259807) (not b!259805) (not b!259809) (not start!55926) (not b!259808))
(check-sat)
(get-model)

(declare-fun d!87138 () Bool)

(declare-fun e!180323 () Bool)

(assert (=> d!87138 e!180323))

(declare-fun res!217618 () Bool)

(assert (=> d!87138 (=> (not res!217618) (not e!180323))))

(declare-datatypes ((tuple2!22280 0))(
  ( (tuple2!22281 (_1!12076 Unit!18491) (_2!12076 BitStream!11370)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11370) tuple2!22280)

(assert (=> d!87138 (= res!217618 (= (buf!6746 (_2!12076 (increaseBitIndex!0 thiss!1754))) (buf!6746 thiss!1754)))))

(declare-fun lt!401849 () Bool)

(assert (=> d!87138 (= lt!401849 (not (= (bvand ((_ sign_extend 24) (select (arr!7211 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12397 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401853 () tuple2!22276)

(assert (=> d!87138 (= lt!401853 (tuple2!22277 (not (= (bvand ((_ sign_extend 24) (select (arr!7211 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12397 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12076 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87138 (validate_offset_bit!0 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))) ((_ sign_extend 32) (currentByte!12402 thiss!1754)) ((_ sign_extend 32) (currentBit!12397 thiss!1754)))))

(assert (=> d!87138 (= (readBit!0 thiss!1754) lt!401853)))

(declare-fun lt!401851 () (_ BitVec 64))

(declare-fun lt!401850 () (_ BitVec 64))

(declare-fun b!259831 () Bool)

(assert (=> b!259831 (= e!180323 (= (bitIndex!0 (size!6224 (buf!6746 (_2!12076 (increaseBitIndex!0 thiss!1754)))) (currentByte!12402 (_2!12076 (increaseBitIndex!0 thiss!1754))) (currentBit!12397 (_2!12076 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401851 lt!401850)))))

(assert (=> b!259831 (or (not (= (bvand lt!401851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401850 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401851 lt!401850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259831 (= lt!401850 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259831 (= lt!401851 (bitIndex!0 (size!6224 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754) (currentBit!12397 thiss!1754)))))

(declare-fun lt!401855 () Bool)

(assert (=> b!259831 (= lt!401855 (not (= (bvand ((_ sign_extend 24) (select (arr!7211 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12397 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401852 () Bool)

(assert (=> b!259831 (= lt!401852 (not (= (bvand ((_ sign_extend 24) (select (arr!7211 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12397 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401854 () Bool)

(assert (=> b!259831 (= lt!401854 (not (= (bvand ((_ sign_extend 24) (select (arr!7211 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12397 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87138 res!217618) b!259831))

(declare-fun m!389117 () Bool)

(assert (=> d!87138 m!389117))

(declare-fun m!389119 () Bool)

(assert (=> d!87138 m!389119))

(declare-fun m!389121 () Bool)

(assert (=> d!87138 m!389121))

(declare-fun m!389123 () Bool)

(assert (=> d!87138 m!389123))

(assert (=> b!259831 m!389119))

(assert (=> b!259831 m!389117))

(assert (=> b!259831 m!389091))

(declare-fun m!389125 () Bool)

(assert (=> b!259831 m!389125))

(assert (=> b!259831 m!389121))

(assert (=> b!259808 d!87138))

(declare-fun d!87140 () Bool)

(assert (=> d!87140 (= (array_inv!5965 (buf!6746 thiss!1754)) (bvsge (size!6224 (buf!6746 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259809 d!87140))

(declare-fun b!259875 () Bool)

(declare-fun e!180356 () Bool)

(declare-fun lt!401963 () (_ BitVec 64))

(declare-fun lt!401956 () tuple2!22276)

(assert (=> b!259875 (= e!180356 (= (bvsub lt!401963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401956))) (currentByte!12402 (_2!12074 lt!401956)) (currentBit!12397 (_2!12074 lt!401956)))))))

(assert (=> b!259875 (or (= (bvand lt!401963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401963 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401960 () (_ BitVec 64))

(assert (=> b!259875 (= lt!401963 (bvadd lt!401960 nBits!535))))

(assert (=> b!259875 (or (not (= (bvand lt!401960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401960 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259875 (= lt!401960 (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401815))) (currentByte!12402 (_2!12074 lt!401815)) (currentBit!12397 (_2!12074 lt!401815))))))

(declare-fun b!259876 () Bool)

(declare-fun e!180355 () tuple2!22276)

(declare-fun e!180359 () tuple2!22276)

(assert (=> b!259876 (= e!180355 e!180359)))

(declare-fun lt!401959 () tuple2!22276)

(assert (=> b!259876 (= lt!401959 (readBit!0 (_2!12074 lt!401815)))))

(declare-fun c!11937 () Bool)

(assert (=> b!259876 (= c!11937 (not (= (_1!12074 lt!401959) expected!109)))))

(declare-fun b!259877 () Bool)

(assert (=> b!259877 (= e!180355 (tuple2!22277 true (_2!12074 lt!401815)))))

(declare-fun b!259878 () Bool)

(declare-fun res!217657 () Bool)

(declare-fun e!180358 () Bool)

(assert (=> b!259878 (=> (not res!217657) (not e!180358))))

(assert (=> b!259878 (= res!217657 e!180356)))

(declare-fun res!217654 () Bool)

(assert (=> b!259878 (=> res!217654 e!180356)))

(assert (=> b!259878 (= res!217654 (not (_1!12074 lt!401956)))))

(declare-fun d!87144 () Bool)

(assert (=> d!87144 e!180358))

(declare-fun res!217656 () Bool)

(assert (=> d!87144 (=> (not res!217656) (not e!180358))))

(declare-fun lt!401954 () (_ BitVec 64))

(assert (=> d!87144 (= res!217656 (bvsge (bvsub lt!401954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401956))) (currentByte!12402 (_2!12074 lt!401956)) (currentBit!12397 (_2!12074 lt!401956)))))))

(assert (=> d!87144 (or (= (bvand lt!401954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401954 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401962 () (_ BitVec 64))

(assert (=> d!87144 (= lt!401954 (bvadd lt!401962 nBits!535))))

(assert (=> d!87144 (or (not (= (bvand lt!401962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401962 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87144 (= lt!401962 (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401815))) (currentByte!12402 (_2!12074 lt!401815)) (currentBit!12397 (_2!12074 lt!401815))))))

(assert (=> d!87144 (= lt!401956 e!180355)))

(declare-fun c!11936 () Bool)

(assert (=> d!87144 (= c!11936 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87144 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87144 (= (checkBitsLoop!0 (_2!12074 lt!401815) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401956)))

(declare-fun b!259879 () Bool)

(declare-fun res!217655 () Bool)

(assert (=> b!259879 (=> (not res!217655) (not e!180358))))

(assert (=> b!259879 (= res!217655 (and (= (buf!6746 (_2!12074 lt!401815)) (buf!6746 (_2!12074 lt!401956))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12074 lt!401956))))))

(declare-fun lt!401953 () tuple2!22276)

(declare-fun b!259880 () Bool)

(assert (=> b!259880 (= lt!401953 (checkBitsLoop!0 (_2!12074 lt!401959) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401958 () Unit!18491)

(declare-fun lt!401955 () Unit!18491)

(assert (=> b!259880 (= lt!401958 lt!401955)))

(declare-fun lt!401957 () (_ BitVec 64))

(declare-fun lt!401961 () (_ BitVec 64))

(assert (=> b!259880 (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401959)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401959))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401959))) (bvsub lt!401957 lt!401961))))

(assert (=> b!259880 (= lt!401955 (validateOffsetBitsIneqLemma!0 (_2!12074 lt!401815) (_2!12074 lt!401959) lt!401957 lt!401961))))

(assert (=> b!259880 (= lt!401961 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259880 (= lt!401957 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259880 (= e!180359 (tuple2!22277 (_1!12074 lt!401953) (_2!12074 lt!401953)))))

(declare-fun b!259881 () Bool)

(declare-fun e!180357 () Bool)

(declare-datatypes ((tuple2!22282 0))(
  ( (tuple2!22283 (_1!12077 BitStream!11370) (_2!12077 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11370) tuple2!22282)

(assert (=> b!259881 (= e!180357 (= expected!109 (_2!12077 (readBitPure!0 (_2!12074 lt!401815)))))))

(declare-fun b!259882 () Bool)

(assert (=> b!259882 (= e!180358 e!180357)))

(declare-fun res!217658 () Bool)

(assert (=> b!259882 (=> res!217658 e!180357)))

(assert (=> b!259882 (= res!217658 (or (not (_1!12074 lt!401956)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259883 () Bool)

(assert (=> b!259883 (= e!180359 (tuple2!22277 false (_2!12074 lt!401959)))))

(assert (= (and d!87144 c!11936) b!259877))

(assert (= (and d!87144 (not c!11936)) b!259876))

(assert (= (and b!259876 c!11937) b!259883))

(assert (= (and b!259876 (not c!11937)) b!259880))

(assert (= (and d!87144 res!217656) b!259879))

(assert (= (and b!259879 res!217655) b!259878))

(assert (= (and b!259878 (not res!217654)) b!259875))

(assert (= (and b!259878 res!217657) b!259882))

(assert (= (and b!259882 (not res!217658)) b!259881))

(declare-fun m!389161 () Bool)

(assert (=> d!87144 m!389161))

(declare-fun m!389163 () Bool)

(assert (=> d!87144 m!389163))

(assert (=> b!259875 m!389161))

(assert (=> b!259875 m!389163))

(declare-fun m!389165 () Bool)

(assert (=> b!259881 m!389165))

(declare-fun m!389167 () Bool)

(assert (=> b!259880 m!389167))

(declare-fun m!389169 () Bool)

(assert (=> b!259880 m!389169))

(declare-fun m!389171 () Bool)

(assert (=> b!259880 m!389171))

(declare-fun m!389173 () Bool)

(assert (=> b!259876 m!389173))

(assert (=> b!259805 d!87144))

(declare-fun d!87176 () Bool)

(declare-fun e!180366 () Bool)

(assert (=> d!87176 e!180366))

(declare-fun res!217663 () Bool)

(assert (=> d!87176 (=> (not res!217663) (not e!180366))))

(declare-fun lt!401991 () (_ BitVec 64))

(declare-fun lt!401995 () (_ BitVec 64))

(declare-fun lt!401990 () (_ BitVec 64))

(assert (=> d!87176 (= res!217663 (= lt!401995 (bvsub lt!401991 lt!401990)))))

(assert (=> d!87176 (or (= (bvand lt!401991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401991 lt!401990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87176 (= lt!401990 (remainingBits!0 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))) ((_ sign_extend 32) (currentByte!12402 thiss!1754)) ((_ sign_extend 32) (currentBit!12397 thiss!1754))))))

(declare-fun lt!401993 () (_ BitVec 64))

(declare-fun lt!401994 () (_ BitVec 64))

(assert (=> d!87176 (= lt!401991 (bvmul lt!401993 lt!401994))))

(assert (=> d!87176 (or (= lt!401993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401994 (bvsdiv (bvmul lt!401993 lt!401994) lt!401993)))))

(assert (=> d!87176 (= lt!401994 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87176 (= lt!401993 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))))))

(assert (=> d!87176 (= lt!401995 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12402 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12397 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87176 (invariant!0 (currentBit!12397 thiss!1754) (currentByte!12402 thiss!1754) (size!6224 (buf!6746 thiss!1754)))))

(assert (=> d!87176 (= (bitIndex!0 (size!6224 (buf!6746 thiss!1754)) (currentByte!12402 thiss!1754) (currentBit!12397 thiss!1754)) lt!401995)))

(declare-fun b!259896 () Bool)

(declare-fun res!217664 () Bool)

(assert (=> b!259896 (=> (not res!217664) (not e!180366))))

(assert (=> b!259896 (= res!217664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401995))))

(declare-fun b!259897 () Bool)

(declare-fun lt!401992 () (_ BitVec 64))

(assert (=> b!259897 (= e!180366 (bvsle lt!401995 (bvmul lt!401992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259897 (or (= lt!401992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401992)))))

(assert (=> b!259897 (= lt!401992 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))))))

(assert (= (and d!87176 res!217663) b!259896))

(assert (= (and b!259896 res!217664) b!259897))

(declare-fun m!389175 () Bool)

(assert (=> d!87176 m!389175))

(declare-fun m!389177 () Bool)

(assert (=> d!87176 m!389177))

(assert (=> b!259805 d!87176))

(declare-fun d!87178 () Bool)

(declare-fun e!180375 () Bool)

(assert (=> d!87178 e!180375))

(declare-fun res!217677 () Bool)

(assert (=> d!87178 (=> (not res!217677) (not e!180375))))

(assert (=> d!87178 (= res!217677 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402006 () Unit!18491)

(declare-fun choose!27 (BitStream!11370 BitStream!11370 (_ BitVec 64) (_ BitVec 64)) Unit!18491)

(assert (=> d!87178 (= lt!402006 (choose!27 thiss!1754 (_2!12074 lt!401815) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87178 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87178 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12074 lt!401815) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402006)))

(declare-fun b!259910 () Bool)

(assert (=> b!259910 (= e!180375 (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401815)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401815))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401815))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87178 res!217677) b!259910))

(declare-fun m!389179 () Bool)

(assert (=> d!87178 m!389179))

(assert (=> b!259910 m!389097))

(assert (=> b!259805 d!87178))

(declare-fun d!87180 () Bool)

(assert (=> d!87180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401815)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401815))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401815))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401815)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401815))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401815)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22083 () Bool)

(assert (= bs!22083 d!87180))

(declare-fun m!389181 () Bool)

(assert (=> bs!22083 m!389181))

(assert (=> b!259805 d!87180))

(declare-fun d!87182 () Bool)

(declare-fun e!180381 () Bool)

(assert (=> d!87182 e!180381))

(declare-fun res!217683 () Bool)

(assert (=> d!87182 (=> (not res!217683) (not e!180381))))

(declare-fun lt!402023 () (_ BitVec 64))

(declare-fun lt!402019 () (_ BitVec 64))

(declare-fun lt!402018 () (_ BitVec 64))

(assert (=> d!87182 (= res!217683 (= lt!402023 (bvsub lt!402019 lt!402018)))))

(assert (=> d!87182 (or (= (bvand lt!402019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402018 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402019 lt!402018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87182 (= lt!402018 (remainingBits!0 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401817)))) ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401817))) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401817)))))))

(declare-fun lt!402021 () (_ BitVec 64))

(declare-fun lt!402022 () (_ BitVec 64))

(assert (=> d!87182 (= lt!402019 (bvmul lt!402021 lt!402022))))

(assert (=> d!87182 (or (= lt!402021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402022 (bvsdiv (bvmul lt!402021 lt!402022) lt!402021)))))

(assert (=> d!87182 (= lt!402022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87182 (= lt!402021 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401817)))))))

(assert (=> d!87182 (= lt!402023 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12402 (_2!12074 lt!401817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12397 (_2!12074 lt!401817)))))))

(assert (=> d!87182 (invariant!0 (currentBit!12397 (_2!12074 lt!401817)) (currentByte!12402 (_2!12074 lt!401817)) (size!6224 (buf!6746 (_2!12074 lt!401817))))))

(assert (=> d!87182 (= (bitIndex!0 (size!6224 (buf!6746 (_2!12074 lt!401817))) (currentByte!12402 (_2!12074 lt!401817)) (currentBit!12397 (_2!12074 lt!401817))) lt!402023)))

(declare-fun b!259920 () Bool)

(declare-fun res!217684 () Bool)

(assert (=> b!259920 (=> (not res!217684) (not e!180381))))

(assert (=> b!259920 (= res!217684 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402023))))

(declare-fun b!259921 () Bool)

(declare-fun lt!402020 () (_ BitVec 64))

(assert (=> b!259921 (= e!180381 (bvsle lt!402023 (bvmul lt!402020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259921 (or (= lt!402020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402020)))))

(assert (=> b!259921 (= lt!402020 ((_ sign_extend 32) (size!6224 (buf!6746 (_2!12074 lt!401817)))))))

(assert (= (and d!87182 res!217683) b!259920))

(assert (= (and b!259920 res!217684) b!259921))

(declare-fun m!389183 () Bool)

(assert (=> d!87182 m!389183))

(declare-fun m!389185 () Bool)

(assert (=> d!87182 m!389185))

(assert (=> b!259805 d!87182))

(declare-fun d!87184 () Bool)

(assert (=> d!87184 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12397 thiss!1754) (currentByte!12402 thiss!1754) (size!6224 (buf!6746 thiss!1754))))))

(declare-fun bs!22084 () Bool)

(assert (= bs!22084 d!87184))

(assert (=> bs!22084 m!389177))

(assert (=> start!55926 d!87184))

(declare-fun d!87188 () Bool)

(assert (=> d!87188 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))) ((_ sign_extend 32) (currentByte!12402 thiss!1754)) ((_ sign_extend 32) (currentBit!12397 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6224 (buf!6746 thiss!1754))) ((_ sign_extend 32) (currentByte!12402 thiss!1754)) ((_ sign_extend 32) (currentBit!12397 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22085 () Bool)

(assert (= bs!22085 d!87188))

(assert (=> bs!22085 m!389175))

(assert (=> b!259807 d!87188))

(check-sat (not b!259831) (not d!87182) (not d!87184) (not d!87144) (not b!259876) (not d!87180) (not d!87178) (not d!87188) (not b!259910) (not b!259875) (not b!259881) (not b!259880) (not d!87138) (not d!87176))
