; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55228 () Bool)

(assert start!55228)

(declare-fun res!215980 () Bool)

(declare-fun e!178753 () Bool)

(assert (=> start!55228 (=> (not res!215980) (not e!178753))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55228 (= res!215980 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55228 e!178753))

(assert (=> start!55228 true))

(declare-datatypes ((array!14025 0))(
  ( (array!14026 (arr!7138 (Array (_ BitVec 32) (_ BitVec 8))) (size!6151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11224 0))(
  ( (BitStream!11225 (buf!6673 array!14025) (currentByte!12224 (_ BitVec 32)) (currentBit!12219 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11224)

(declare-fun e!178755 () Bool)

(declare-fun inv!12 (BitStream!11224) Bool)

(assert (=> start!55228 (and (inv!12 thiss!1754) e!178755)))

(declare-fun b!257742 () Bool)

(declare-fun e!178756 () Bool)

(declare-datatypes ((tuple2!22064 0))(
  ( (tuple2!22065 (_1!11968 Bool) (_2!11968 BitStream!11224)) )
))
(declare-fun lt!398986 () tuple2!22064)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257742 (= e!178756 (not (invariant!0 (currentBit!12219 (_2!11968 lt!398986)) (currentByte!12224 (_2!11968 lt!398986)) (size!6151 (buf!6673 (_2!11968 lt!398986))))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!398987 () tuple2!22064)

(declare-fun checkBitsLoop!0 (BitStream!11224 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22064)

(assert (=> b!257742 (= lt!398986 (checkBitsLoop!0 (_2!11968 lt!398987) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257742 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18405 0))(
  ( (Unit!18406) )
))
(declare-fun lt!398985 () Unit!18405)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11224 BitStream!11224 (_ BitVec 64) (_ BitVec 64)) Unit!18405)

(assert (=> b!257742 (= lt!398985 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11968 lt!398987) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257743 () Bool)

(declare-fun res!215982 () Bool)

(assert (=> b!257743 (=> (not res!215982) (not e!178753))))

(assert (=> b!257743 (= res!215982 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257744 () Bool)

(declare-fun array_inv!5892 (array!14025) Bool)

(assert (=> b!257744 (= e!178755 (array_inv!5892 (buf!6673 thiss!1754)))))

(declare-fun b!257745 () Bool)

(assert (=> b!257745 (= e!178753 e!178756)))

(declare-fun res!215981 () Bool)

(assert (=> b!257745 (=> (not res!215981) (not e!178756))))

(assert (=> b!257745 (= res!215981 (= (_1!11968 lt!398987) expected!109))))

(declare-fun readBit!0 (BitStream!11224) tuple2!22064)

(assert (=> b!257745 (= lt!398987 (readBit!0 thiss!1754))))

(declare-fun b!257746 () Bool)

(declare-fun res!215983 () Bool)

(assert (=> b!257746 (=> (not res!215983) (not e!178753))))

(assert (=> b!257746 (= res!215983 (not (= from!526 nBits!535)))))

(assert (= (and start!55228 res!215980) b!257743))

(assert (= (and b!257743 res!215982) b!257746))

(assert (= (and b!257746 res!215983) b!257745))

(assert (= (and b!257745 res!215981) b!257742))

(assert (= start!55228 b!257744))

(declare-fun m!387215 () Bool)

(assert (=> b!257742 m!387215))

(declare-fun m!387217 () Bool)

(assert (=> b!257742 m!387217))

(declare-fun m!387219 () Bool)

(assert (=> b!257742 m!387219))

(declare-fun m!387221 () Bool)

(assert (=> b!257742 m!387221))

(declare-fun m!387223 () Bool)

(assert (=> start!55228 m!387223))

(declare-fun m!387225 () Bool)

(assert (=> b!257744 m!387225))

(declare-fun m!387227 () Bool)

(assert (=> b!257743 m!387227))

(declare-fun m!387229 () Bool)

(assert (=> b!257745 m!387229))

(push 1)

(assert (not start!55228))

(assert (not b!257743))

(assert (not b!257744))

(assert (not b!257745))

(assert (not b!257742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86426 () Bool)

(assert (=> d!86426 (= (array_inv!5892 (buf!6673 thiss!1754)) (bvsge (size!6151 (buf!6673 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257744 d!86426))

(declare-fun d!86428 () Bool)

(declare-fun e!178791 () Bool)

(assert (=> d!86428 e!178791))

(declare-fun res!216010 () Bool)

(assert (=> d!86428 (=> (not res!216010) (not e!178791))))

(declare-datatypes ((tuple2!22072 0))(
  ( (tuple2!22073 (_1!11972 Unit!18405) (_2!11972 BitStream!11224)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11224) tuple2!22072)

(assert (=> d!86428 (= res!216010 (= (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754))) (buf!6673 thiss!1754)))))

(declare-fun lt!399020 () Bool)

(assert (=> d!86428 (= lt!399020 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399025 () tuple2!22064)

(assert (=> d!86428 (= lt!399025 (tuple2!22065 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11972 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86428 (validate_offset_bit!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754)))))

(assert (=> d!86428 (= (readBit!0 thiss!1754) lt!399025)))

(declare-fun lt!399023 () (_ BitVec 64))

(declare-fun lt!399022 () (_ BitVec 64))

(declare-fun b!257779 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257779 (= e!178791 (= (bitIndex!0 (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754)))) (currentByte!12224 (_2!11972 (increaseBitIndex!0 thiss!1754))) (currentBit!12219 (_2!11972 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399023 lt!399022)))))

(assert (=> b!257779 (or (not (= (bvand lt!399023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399022 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399023 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399023 lt!399022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257779 (= lt!399022 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257779 (= lt!399023 (bitIndex!0 (size!6151 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754) (currentBit!12219 thiss!1754)))))

(declare-fun lt!399026 () Bool)

(assert (=> b!257779 (= lt!399026 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399021 () Bool)

(assert (=> b!257779 (= lt!399021 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399024 () Bool)

(assert (=> b!257779 (= lt!399024 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86428 res!216010) b!257779))

(declare-fun m!387265 () Bool)

(assert (=> d!86428 m!387265))

(declare-fun m!387267 () Bool)

(assert (=> d!86428 m!387267))

(declare-fun m!387269 () Bool)

(assert (=> d!86428 m!387269))

(declare-fun m!387271 () Bool)

(assert (=> d!86428 m!387271))

(assert (=> b!257779 m!387265))

(assert (=> b!257779 m!387269))

(declare-fun m!387273 () Bool)

(assert (=> b!257779 m!387273))

(assert (=> b!257779 m!387267))

(declare-fun m!387275 () Bool)

(assert (=> b!257779 m!387275))

(assert (=> b!257745 d!86428))

(declare-fun d!86434 () Bool)

(assert (=> d!86434 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12219 thiss!1754) (currentByte!12224 thiss!1754) (size!6151 (buf!6673 thiss!1754))))))

(declare-fun bs!21880 () Bool)

(assert (= bs!21880 d!86434))

(declare-fun m!387277 () Bool)

(assert (=> bs!21880 m!387277))

(assert (=> start!55228 d!86434))

(declare-fun d!86436 () Bool)

(assert (=> d!86436 (= (invariant!0 (currentBit!12219 (_2!11968 lt!398986)) (currentByte!12224 (_2!11968 lt!398986)) (size!6151 (buf!6673 (_2!11968 lt!398986)))) (and (bvsge (currentBit!12219 (_2!11968 lt!398986)) #b00000000000000000000000000000000) (bvslt (currentBit!12219 (_2!11968 lt!398986)) #b00000000000000000000000000001000) (bvsge (currentByte!12224 (_2!11968 lt!398986)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12224 (_2!11968 lt!398986)) (size!6151 (buf!6673 (_2!11968 lt!398986)))) (and (= (currentBit!12219 (_2!11968 lt!398986)) #b00000000000000000000000000000000) (= (currentByte!12224 (_2!11968 lt!398986)) (size!6151 (buf!6673 (_2!11968 lt!398986))))))))))

(assert (=> b!257742 d!86436))

(declare-fun b!257833 () Bool)

(declare-fun e!178829 () tuple2!22064)

(assert (=> b!257833 (= e!178829 (tuple2!22065 true (_2!11968 lt!398987)))))

(declare-fun b!257834 () Bool)

(declare-fun res!216044 () Bool)

(declare-fun e!178833 () Bool)

(assert (=> b!257834 (=> (not res!216044) (not e!178833))))

(declare-fun lt!399126 () tuple2!22064)

(assert (=> b!257834 (= res!216044 (and (= (buf!6673 (_2!11968 lt!398987)) (buf!6673 (_2!11968 lt!399126))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11968 lt!399126))))))

(declare-fun lt!399128 () (_ BitVec 64))

(declare-fun b!257835 () Bool)

(declare-fun e!178832 () Bool)

(assert (=> b!257835 (= e!178832 (= (bvsub lt!399128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399126))) (currentByte!12224 (_2!11968 lt!399126)) (currentBit!12219 (_2!11968 lt!399126)))))))

(assert (=> b!257835 (or (= (bvand lt!399128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399125 () (_ BitVec 64))

(assert (=> b!257835 (= lt!399128 (bvadd lt!399125 nBits!535))))

(assert (=> b!257835 (or (not (= (bvand lt!399125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399125 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257835 (= lt!399125 (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)) (currentBit!12219 (_2!11968 lt!398987))))))

(declare-fun b!257836 () Bool)

(declare-fun res!216048 () Bool)

(assert (=> b!257836 (=> (not res!216048) (not e!178833))))

(assert (=> b!257836 (= res!216048 e!178832)))

(declare-fun res!216045 () Bool)

(assert (=> b!257836 (=> res!216045 e!178832)))

(assert (=> b!257836 (= res!216045 (not (_1!11968 lt!399126)))))

(declare-fun b!257837 () Bool)

(declare-fun e!178830 () tuple2!22064)

(assert (=> b!257837 (= e!178829 e!178830)))

(declare-fun lt!399121 () tuple2!22064)

(assert (=> b!257837 (= lt!399121 (readBit!0 (_2!11968 lt!398987)))))

(declare-fun c!11828 () Bool)

(assert (=> b!257837 (= c!11828 (not (= (_1!11968 lt!399121) expected!109)))))

(declare-fun lt!399123 () tuple2!22064)

(declare-fun b!257838 () Bool)

(assert (=> b!257838 (= lt!399123 (checkBitsLoop!0 (_2!11968 lt!399121) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399130 () Unit!18405)

(declare-fun lt!399129 () Unit!18405)

(assert (=> b!257838 (= lt!399130 lt!399129)))

(declare-fun lt!399122 () (_ BitVec 64))

(declare-fun lt!399127 () (_ BitVec 64))

(assert (=> b!257838 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399121)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399121))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399121))) (bvsub lt!399122 lt!399127))))

(assert (=> b!257838 (= lt!399129 (validateOffsetBitsIneqLemma!0 (_2!11968 lt!398987) (_2!11968 lt!399121) lt!399122 lt!399127))))

(assert (=> b!257838 (= lt!399127 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257838 (= lt!399122 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!257838 (= e!178830 (tuple2!22065 (_1!11968 lt!399123) (_2!11968 lt!399123)))))

(declare-fun b!257839 () Bool)

(declare-fun e!178831 () Bool)

(assert (=> b!257839 (= e!178833 e!178831)))

(declare-fun res!216046 () Bool)

(assert (=> b!257839 (=> res!216046 e!178831)))

(assert (=> b!257839 (= res!216046 (or (not (_1!11968 lt!399126)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!257840 () Bool)

(declare-datatypes ((tuple2!22076 0))(
  ( (tuple2!22077 (_1!11974 BitStream!11224) (_2!11974 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11224) tuple2!22076)

(assert (=> b!257840 (= e!178831 (= expected!109 (_2!11974 (readBitPure!0 (_2!11968 lt!398987)))))))

(declare-fun d!86438 () Bool)

(assert (=> d!86438 e!178833))

(declare-fun res!216047 () Bool)

(assert (=> d!86438 (=> (not res!216047) (not e!178833))))

(declare-fun lt!399124 () (_ BitVec 64))

(assert (=> d!86438 (= res!216047 (bvsge (bvsub lt!399124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399126))) (currentByte!12224 (_2!11968 lt!399126)) (currentBit!12219 (_2!11968 lt!399126)))))))

(assert (=> d!86438 (or (= (bvand lt!399124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399124 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399120 () (_ BitVec 64))

(assert (=> d!86438 (= lt!399124 (bvadd lt!399120 nBits!535))))

(assert (=> d!86438 (or (not (= (bvand lt!399120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399120 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86438 (= lt!399120 (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)) (currentBit!12219 (_2!11968 lt!398987))))))

(assert (=> d!86438 (= lt!399126 e!178829)))

(declare-fun c!11829 () Bool)

(assert (=> d!86438 (= c!11829 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86438 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86438 (= (checkBitsLoop!0 (_2!11968 lt!398987) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399126)))

(declare-fun b!257841 () Bool)

(assert (=> b!257841 (= e!178830 (tuple2!22065 false (_2!11968 lt!399121)))))

(assert (= (and d!86438 c!11829) b!257833))

(assert (= (and d!86438 (not c!11829)) b!257837))

(assert (= (and b!257837 c!11828) b!257841))

(assert (= (and b!257837 (not c!11828)) b!257838))

(assert (= (and d!86438 res!216047) b!257834))

(assert (= (and b!257834 res!216044) b!257836))

(assert (= (and b!257836 (not res!216045)) b!257835))

(assert (= (and b!257836 res!216048) b!257839))

(assert (= (and b!257839 (not res!216046)) b!257840))

(declare-fun m!387309 () Bool)

(assert (=> b!257837 m!387309))

(declare-fun m!387311 () Bool)

(assert (=> b!257838 m!387311))

(declare-fun m!387313 () Bool)

(assert (=> b!257838 m!387313))

(declare-fun m!387315 () Bool)

(assert (=> b!257838 m!387315))

(declare-fun m!387317 () Bool)

(assert (=> b!257835 m!387317))

(declare-fun m!387319 () Bool)

(assert (=> b!257835 m!387319))

(declare-fun m!387321 () Bool)

(assert (=> b!257840 m!387321))

(assert (=> d!86438 m!387317))

(assert (=> d!86438 m!387319))

(assert (=> b!257742 d!86438))

(declare-fun d!86450 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21882 () Bool)

(assert (= bs!21882 d!86450))

(declare-fun m!387323 () Bool)

(assert (=> bs!21882 m!387323))

(assert (=> b!257742 d!86450))

(declare-fun d!86452 () Bool)

(declare-fun e!178847 () Bool)

(assert (=> d!86452 e!178847))

(declare-fun res!216062 () Bool)

(assert (=> d!86452 (=> (not res!216062) (not e!178847))))

(assert (=> d!86452 (= res!216062 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399162 () Unit!18405)

(declare-fun choose!27 (BitStream!11224 BitStream!11224 (_ BitVec 64) (_ BitVec 64)) Unit!18405)

(assert (=> d!86452 (= lt!399162 (choose!27 thiss!1754 (_2!11968 lt!398987) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86452 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86452 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11968 lt!398987) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399162)))

(declare-fun b!257863 () Bool)

(assert (=> b!257863 (= e!178847 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86452 res!216062) b!257863))

(declare-fun m!387341 () Bool)

(assert (=> d!86452 m!387341))

(assert (=> b!257863 m!387219))

(assert (=> b!257742 d!86452))

(declare-fun d!86460 () Bool)

(assert (=> d!86460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21885 () Bool)

(assert (= bs!21885 d!86460))

(declare-fun m!387343 () Bool)

(assert (=> bs!21885 m!387343))

(assert (=> b!257743 d!86460))

(push 1)

(assert (not b!257863))

(assert (not b!257838))

(assert (not d!86452))

(assert (not d!86460))

(assert (not d!86450))

(assert (not b!257779))

(assert (not d!86434))

(assert (not b!257840))

(assert (not b!257835))

(assert (not d!86438))

(assert (not b!257837))

(assert (not d!86428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86530 () Bool)

(assert (=> d!86530 (= (invariant!0 (currentBit!12219 thiss!1754) (currentByte!12224 thiss!1754) (size!6151 (buf!6673 thiss!1754))) (and (bvsge (currentBit!12219 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12219 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12224 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12224 thiss!1754) (size!6151 (buf!6673 thiss!1754))) (and (= (currentBit!12219 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12224 thiss!1754) (size!6151 (buf!6673 thiss!1754)))))))))

(assert (=> d!86434 d!86530))

(declare-fun d!86532 () Bool)

(declare-fun e!178890 () Bool)

(assert (=> d!86532 e!178890))

(declare-fun res!216125 () Bool)

(assert (=> d!86532 (=> (not res!216125) (not e!178890))))

(declare-fun lt!399335 () (_ BitVec 64))

(declare-fun lt!399338 () (_ BitVec 64))

(declare-fun lt!399339 () (_ BitVec 64))

(assert (=> d!86532 (= res!216125 (= lt!399338 (bvsub lt!399335 lt!399339)))))

(assert (=> d!86532 (or (= (bvand lt!399335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399339 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399335 lt!399339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86532 (= lt!399339 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399126)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399126))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399126)))))))

(declare-fun lt!399336 () (_ BitVec 64))

(declare-fun lt!399340 () (_ BitVec 64))

(assert (=> d!86532 (= lt!399335 (bvmul lt!399336 lt!399340))))

(assert (=> d!86532 (or (= lt!399336 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399340 (bvsdiv (bvmul lt!399336 lt!399340) lt!399336)))))

(assert (=> d!86532 (= lt!399340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86532 (= lt!399336 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399126)))))))

(assert (=> d!86532 (= lt!399338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399126))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399126)))))))

(assert (=> d!86532 (invariant!0 (currentBit!12219 (_2!11968 lt!399126)) (currentByte!12224 (_2!11968 lt!399126)) (size!6151 (buf!6673 (_2!11968 lt!399126))))))

(assert (=> d!86532 (= (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399126))) (currentByte!12224 (_2!11968 lt!399126)) (currentBit!12219 (_2!11968 lt!399126))) lt!399338)))

(declare-fun b!257938 () Bool)

(declare-fun res!216126 () Bool)

(assert (=> b!257938 (=> (not res!216126) (not e!178890))))

(assert (=> b!257938 (= res!216126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399338))))

(declare-fun b!257939 () Bool)

(declare-fun lt!399337 () (_ BitVec 64))

(assert (=> b!257939 (= e!178890 (bvsle lt!399338 (bvmul lt!399337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257939 (or (= lt!399337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399337)))))

(assert (=> b!257939 (= lt!399337 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399126)))))))

(assert (= (and d!86532 res!216125) b!257938))

(assert (= (and b!257938 res!216126) b!257939))

(declare-fun m!387449 () Bool)

(assert (=> d!86532 m!387449))

(declare-fun m!387451 () Bool)

(assert (=> d!86532 m!387451))

(assert (=> b!257835 d!86532))

(declare-fun d!86534 () Bool)

(declare-fun e!178891 () Bool)

(assert (=> d!86534 e!178891))

(declare-fun res!216127 () Bool)

(assert (=> d!86534 (=> (not res!216127) (not e!178891))))

(declare-fun lt!399345 () (_ BitVec 64))

(declare-fun lt!399341 () (_ BitVec 64))

(declare-fun lt!399344 () (_ BitVec 64))

(assert (=> d!86534 (= res!216127 (= lt!399344 (bvsub lt!399341 lt!399345)))))

(assert (=> d!86534 (or (= (bvand lt!399341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399341 lt!399345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86534 (= lt!399345 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987)))))))

(declare-fun lt!399342 () (_ BitVec 64))

(declare-fun lt!399346 () (_ BitVec 64))

(assert (=> d!86534 (= lt!399341 (bvmul lt!399342 lt!399346))))

(assert (=> d!86534 (or (= lt!399342 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399346 (bvsdiv (bvmul lt!399342 lt!399346) lt!399342)))))

(assert (=> d!86534 (= lt!399346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86534 (= lt!399342 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))))))

(assert (=> d!86534 (= lt!399344 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987)))))))

(assert (=> d!86534 (invariant!0 (currentBit!12219 (_2!11968 lt!398987)) (currentByte!12224 (_2!11968 lt!398987)) (size!6151 (buf!6673 (_2!11968 lt!398987))))))

(assert (=> d!86534 (= (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)) (currentBit!12219 (_2!11968 lt!398987))) lt!399344)))

(declare-fun b!257940 () Bool)

(declare-fun res!216128 () Bool)

(assert (=> b!257940 (=> (not res!216128) (not e!178891))))

(assert (=> b!257940 (= res!216128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399344))))

(declare-fun b!257941 () Bool)

(declare-fun lt!399343 () (_ BitVec 64))

(assert (=> b!257941 (= e!178891 (bvsle lt!399344 (bvmul lt!399343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257941 (or (= lt!399343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399343)))))

(assert (=> b!257941 (= lt!399343 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))))))

(assert (= (and d!86534 res!216127) b!257940))

(assert (= (and b!257940 res!216128) b!257941))

(assert (=> d!86534 m!387323))

(declare-fun m!387453 () Bool)

(assert (=> d!86534 m!387453))

(assert (=> b!257835 d!86534))

(assert (=> b!257863 d!86450))

(declare-fun d!86536 () Bool)

(declare-fun e!178892 () Bool)

(assert (=> d!86536 e!178892))

(declare-fun res!216129 () Bool)

(assert (=> d!86536 (=> (not res!216129) (not e!178892))))

(assert (=> d!86536 (= res!216129 (= (buf!6673 (_2!11972 (increaseBitIndex!0 (_2!11968 lt!398987)))) (buf!6673 (_2!11968 lt!398987))))))

(declare-fun lt!399347 () Bool)

(assert (=> d!86536 (= lt!399347 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 (_2!11968 lt!398987))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399352 () tuple2!22064)

(assert (=> d!86536 (= lt!399352 (tuple2!22065 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 (_2!11968 lt!398987))))) #b00000000000000000000000000000000)) (_2!11972 (increaseBitIndex!0 (_2!11968 lt!398987)))))))

(assert (=> d!86536 (validate_offset_bit!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))))))

(assert (=> d!86536 (= (readBit!0 (_2!11968 lt!398987)) lt!399352)))

(declare-fun b!257942 () Bool)

(declare-fun lt!399350 () (_ BitVec 64))

(declare-fun lt!399349 () (_ BitVec 64))

(assert (=> b!257942 (= e!178892 (= (bitIndex!0 (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 (_2!11968 lt!398987))))) (currentByte!12224 (_2!11972 (increaseBitIndex!0 (_2!11968 lt!398987)))) (currentBit!12219 (_2!11972 (increaseBitIndex!0 (_2!11968 lt!398987))))) (bvadd lt!399350 lt!399349)))))

(assert (=> b!257942 (or (not (= (bvand lt!399350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399349 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399350 lt!399349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257942 (= lt!399349 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257942 (= lt!399350 (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)) (currentBit!12219 (_2!11968 lt!398987))))))

(declare-fun lt!399353 () Bool)

(assert (=> b!257942 (= lt!399353 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 (_2!11968 lt!398987))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399348 () Bool)

(assert (=> b!257942 (= lt!399348 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 (_2!11968 lt!398987))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399351 () Bool)

(assert (=> b!257942 (= lt!399351 (not (= (bvand ((_ sign_extend 24) (select (arr!7138 (buf!6673 (_2!11968 lt!398987))) (currentByte!12224 (_2!11968 lt!398987)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12219 (_2!11968 lt!398987))))) #b00000000000000000000000000000000)))))

(assert (= (and d!86536 res!216129) b!257942))

(declare-fun m!387455 () Bool)

(assert (=> d!86536 m!387455))

(declare-fun m!387457 () Bool)

(assert (=> d!86536 m!387457))

(declare-fun m!387459 () Bool)

(assert (=> d!86536 m!387459))

(declare-fun m!387461 () Bool)

(assert (=> d!86536 m!387461))

(assert (=> b!257942 m!387455))

(assert (=> b!257942 m!387459))

(assert (=> b!257942 m!387319))

(assert (=> b!257942 m!387457))

(declare-fun m!387463 () Bool)

(assert (=> b!257942 m!387463))

(assert (=> b!257837 d!86536))

(declare-fun b!257943 () Bool)

(declare-fun e!178893 () tuple2!22064)

(assert (=> b!257943 (= e!178893 (tuple2!22065 true (_2!11968 lt!399121)))))

(declare-fun b!257944 () Bool)

(declare-fun res!216130 () Bool)

(declare-fun e!178897 () Bool)

(assert (=> b!257944 (=> (not res!216130) (not e!178897))))

(declare-fun lt!399360 () tuple2!22064)

(assert (=> b!257944 (= res!216130 (and (= (buf!6673 (_2!11968 lt!399121)) (buf!6673 (_2!11968 lt!399360))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!11968 lt!399360))))))

(declare-fun lt!399362 () (_ BitVec 64))

(declare-fun b!257945 () Bool)

(declare-fun e!178896 () Bool)

(assert (=> b!257945 (= e!178896 (= (bvsub lt!399362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399360))) (currentByte!12224 (_2!11968 lt!399360)) (currentBit!12219 (_2!11968 lt!399360)))))))

(assert (=> b!257945 (or (= (bvand lt!399362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399359 () (_ BitVec 64))

(assert (=> b!257945 (= lt!399362 (bvadd lt!399359 nBits!535))))

(assert (=> b!257945 (or (not (= (bvand lt!399359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399359 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257945 (= lt!399359 (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399121))) (currentByte!12224 (_2!11968 lt!399121)) (currentBit!12219 (_2!11968 lt!399121))))))

(declare-fun b!257946 () Bool)

(declare-fun res!216134 () Bool)

(assert (=> b!257946 (=> (not res!216134) (not e!178897))))

(assert (=> b!257946 (= res!216134 e!178896)))

(declare-fun res!216131 () Bool)

(assert (=> b!257946 (=> res!216131 e!178896)))

(assert (=> b!257946 (= res!216131 (not (_1!11968 lt!399360)))))

(declare-fun b!257947 () Bool)

(declare-fun e!178894 () tuple2!22064)

(assert (=> b!257947 (= e!178893 e!178894)))

(declare-fun lt!399355 () tuple2!22064)

(assert (=> b!257947 (= lt!399355 (readBit!0 (_2!11968 lt!399121)))))

(declare-fun c!11840 () Bool)

(assert (=> b!257947 (= c!11840 (not (= (_1!11968 lt!399355) expected!109)))))

(declare-fun b!257948 () Bool)

(declare-fun lt!399357 () tuple2!22064)

(assert (=> b!257948 (= lt!399357 (checkBitsLoop!0 (_2!11968 lt!399355) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399364 () Unit!18405)

(declare-fun lt!399363 () Unit!18405)

(assert (=> b!257948 (= lt!399364 lt!399363)))

(declare-fun lt!399356 () (_ BitVec 64))

(declare-fun lt!399361 () (_ BitVec 64))

(assert (=> b!257948 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399355)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399355))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399355))) (bvsub lt!399356 lt!399361))))

(assert (=> b!257948 (= lt!399363 (validateOffsetBitsIneqLemma!0 (_2!11968 lt!399121) (_2!11968 lt!399355) lt!399356 lt!399361))))

(assert (=> b!257948 (= lt!399361 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257948 (= lt!399356 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!257948 (= e!178894 (tuple2!22065 (_1!11968 lt!399357) (_2!11968 lt!399357)))))

(declare-fun b!257949 () Bool)

(declare-fun e!178895 () Bool)

(assert (=> b!257949 (= e!178897 e!178895)))

(declare-fun res!216132 () Bool)

(assert (=> b!257949 (=> res!216132 e!178895)))

(assert (=> b!257949 (= res!216132 (or (not (_1!11968 lt!399360)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535)))))

(declare-fun b!257950 () Bool)

(assert (=> b!257950 (= e!178895 (= expected!109 (_2!11974 (readBitPure!0 (_2!11968 lt!399121)))))))

(declare-fun d!86538 () Bool)

(assert (=> d!86538 e!178897))

(declare-fun res!216133 () Bool)

(assert (=> d!86538 (=> (not res!216133) (not e!178897))))

(declare-fun lt!399358 () (_ BitVec 64))

(assert (=> d!86538 (= res!216133 (bvsge (bvsub lt!399358 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399360))) (currentByte!12224 (_2!11968 lt!399360)) (currentBit!12219 (_2!11968 lt!399360)))))))

(assert (=> d!86538 (or (= (bvand lt!399358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399358 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399354 () (_ BitVec 64))

(assert (=> d!86538 (= lt!399358 (bvadd lt!399354 nBits!535))))

(assert (=> d!86538 (or (not (= (bvand lt!399354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399354 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86538 (= lt!399354 (bitIndex!0 (size!6151 (buf!6673 (_2!11968 lt!399121))) (currentByte!12224 (_2!11968 lt!399121)) (currentBit!12219 (_2!11968 lt!399121))))))

(assert (=> d!86538 (= lt!399360 e!178893)))

(declare-fun c!11841 () Bool)

(assert (=> d!86538 (= c!11841 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535))))

(assert (=> d!86538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86538 (= (checkBitsLoop!0 (_2!11968 lt!399121) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!399360)))

(declare-fun b!257951 () Bool)

(assert (=> b!257951 (= e!178894 (tuple2!22065 false (_2!11968 lt!399355)))))

(assert (= (and d!86538 c!11841) b!257943))

(assert (= (and d!86538 (not c!11841)) b!257947))

(assert (= (and b!257947 c!11840) b!257951))

(assert (= (and b!257947 (not c!11840)) b!257948))

(assert (= (and d!86538 res!216133) b!257944))

(assert (= (and b!257944 res!216130) b!257946))

(assert (= (and b!257946 (not res!216131)) b!257945))

(assert (= (and b!257946 res!216134) b!257949))

(assert (= (and b!257949 (not res!216132)) b!257950))

(declare-fun m!387465 () Bool)

(assert (=> b!257947 m!387465))

(declare-fun m!387467 () Bool)

(assert (=> b!257948 m!387467))

(declare-fun m!387469 () Bool)

(assert (=> b!257948 m!387469))

(declare-fun m!387471 () Bool)

(assert (=> b!257948 m!387471))

(declare-fun m!387473 () Bool)

(assert (=> b!257945 m!387473))

(declare-fun m!387475 () Bool)

(assert (=> b!257945 m!387475))

(declare-fun m!387477 () Bool)

(assert (=> b!257950 m!387477))

(assert (=> d!86538 m!387473))

(assert (=> d!86538 m!387475))

(assert (=> b!257838 d!86538))

(declare-fun d!86540 () Bool)

(assert (=> d!86540 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399121)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399121))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399121))) (bvsub lt!399122 lt!399127)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399121)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399121))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399121)))) (bvsub lt!399122 lt!399127)))))

(declare-fun bs!21896 () Bool)

(assert (= bs!21896 d!86540))

(declare-fun m!387479 () Bool)

(assert (=> bs!21896 m!387479))

(assert (=> b!257838 d!86540))

(declare-fun d!86542 () Bool)

(declare-fun e!178898 () Bool)

(assert (=> d!86542 e!178898))

(declare-fun res!216135 () Bool)

(assert (=> d!86542 (=> (not res!216135) (not e!178898))))

(assert (=> d!86542 (= res!216135 (or (= (bvand lt!399122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399122 lt!399127) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399365 () Unit!18405)

(assert (=> d!86542 (= lt!399365 (choose!27 (_2!11968 lt!398987) (_2!11968 lt!399121) lt!399122 lt!399127))))

(assert (=> d!86542 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399127) (bvsle lt!399127 lt!399122))))

(assert (=> d!86542 (= (validateOffsetBitsIneqLemma!0 (_2!11968 lt!398987) (_2!11968 lt!399121) lt!399122 lt!399127) lt!399365)))

(declare-fun b!257952 () Bool)

(assert (=> b!257952 (= e!178898 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!399121)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!399121))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!399121))) (bvsub lt!399122 lt!399127)))))

(assert (= (and d!86542 res!216135) b!257952))

(declare-fun m!387481 () Bool)

(assert (=> d!86542 m!387481))

(assert (=> b!257952 m!387313))

(assert (=> b!257838 d!86542))

(declare-fun d!86544 () Bool)

(declare-fun e!178901 () Bool)

(assert (=> d!86544 e!178901))

(declare-fun res!216140 () Bool)

(assert (=> d!86544 (=> (not res!216140) (not e!178901))))

(declare-fun lt!399378 () (_ BitVec 64))

(declare-fun lt!399379 () (_ BitVec 64))

(declare-fun lt!399376 () tuple2!22072)

(assert (=> d!86544 (= res!216140 (= (bvadd lt!399379 lt!399378) (bitIndex!0 (size!6151 (buf!6673 (_2!11972 lt!399376))) (currentByte!12224 (_2!11972 lt!399376)) (currentBit!12219 (_2!11972 lt!399376)))))))

(assert (=> d!86544 (or (not (= (bvand lt!399379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399378 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399379 lt!399378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86544 (= lt!399378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86544 (= lt!399379 (bitIndex!0 (size!6151 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754) (currentBit!12219 thiss!1754)))))

(declare-fun Unit!18415 () Unit!18405)

(declare-fun Unit!18416 () Unit!18405)

(assert (=> d!86544 (= lt!399376 (ite (bvslt (currentBit!12219 thiss!1754) #b00000000000000000000000000000111) (tuple2!22073 Unit!18415 (BitStream!11225 (buf!6673 thiss!1754) (currentByte!12224 thiss!1754) (bvadd (currentBit!12219 thiss!1754) #b00000000000000000000000000000001))) (tuple2!22073 Unit!18416 (BitStream!11225 (buf!6673 thiss!1754) (bvadd (currentByte!12224 thiss!1754) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!86544 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!86544 (= (increaseBitIndex!0 thiss!1754) lt!399376)))

(declare-fun b!257957 () Bool)

(declare-fun res!216141 () Bool)

(assert (=> b!257957 (=> (not res!216141) (not e!178901))))

(declare-fun lt!399377 () (_ BitVec 64))

(declare-fun lt!399380 () (_ BitVec 64))

(assert (=> b!257957 (= res!216141 (= (bvsub lt!399377 lt!399380) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!257957 (or (= (bvand lt!399377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399377 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399377 lt!399380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257957 (= lt!399380 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11972 lt!399376)))) ((_ sign_extend 32) (currentByte!12224 (_2!11972 lt!399376))) ((_ sign_extend 32) (currentBit!12219 (_2!11972 lt!399376)))))))

(assert (=> b!257957 (= lt!399377 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))))))

(declare-fun b!257958 () Bool)

(assert (=> b!257958 (= e!178901 (= (size!6151 (buf!6673 thiss!1754)) (size!6151 (buf!6673 (_2!11972 lt!399376)))))))

(assert (= (and d!86544 res!216140) b!257957))

(assert (= (and b!257957 res!216141) b!257958))

(declare-fun m!387483 () Bool)

(assert (=> d!86544 m!387483))

(assert (=> d!86544 m!387273))

(assert (=> d!86544 m!387343))

(declare-fun m!387485 () Bool)

(assert (=> b!257957 m!387485))

(assert (=> b!257957 m!387343))

(assert (=> d!86428 d!86544))

(declare-fun d!86546 () Bool)

(assert (=> d!86546 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21897 () Bool)

(assert (= bs!21897 d!86546))

(assert (=> bs!21897 m!387343))

(assert (=> d!86428 d!86546))

(assert (=> d!86438 d!86532))

(assert (=> d!86438 d!86534))

(declare-fun d!86548 () Bool)

(assert (=> d!86548 (= (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 thiss!1754)))))))

(assert (=> d!86460 d!86548))

(declare-fun d!86550 () Bool)

(declare-fun lt!399383 () tuple2!22064)

(assert (=> d!86550 (= lt!399383 (readBit!0 (_2!11968 lt!398987)))))

(assert (=> d!86550 (= (readBitPure!0 (_2!11968 lt!398987)) (tuple2!22077 (_2!11968 lt!399383) (_1!11968 lt!399383)))))

(declare-fun bs!21898 () Bool)

(assert (= bs!21898 d!86550))

(assert (=> bs!21898 m!387309))

(assert (=> b!257840 d!86550))

(declare-fun d!86552 () Bool)

(assert (=> d!86552 (validate_offset_bits!1 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86552 true))

(declare-fun _$1!351 () Unit!18405)

(assert (=> d!86552 (= (choose!27 thiss!1754 (_2!11968 lt!398987) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!351)))

(declare-fun bs!21899 () Bool)

(assert (= bs!21899 d!86552))

(assert (=> bs!21899 m!387219))

(assert (=> d!86452 d!86552))

(declare-fun d!86554 () Bool)

(assert (=> d!86554 (= (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987)))) (bvsub (bvmul ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11968 lt!398987)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 (_2!11968 lt!398987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 (_2!11968 lt!398987))))))))

(assert (=> d!86450 d!86554))

(declare-fun d!86556 () Bool)

(declare-fun e!178902 () Bool)

(assert (=> d!86556 e!178902))

(declare-fun res!216142 () Bool)

(assert (=> d!86556 (=> (not res!216142) (not e!178902))))

(declare-fun lt!399387 () (_ BitVec 64))

(declare-fun lt!399388 () (_ BitVec 64))

(declare-fun lt!399384 () (_ BitVec 64))

(assert (=> d!86556 (= res!216142 (= lt!399387 (bvsub lt!399384 lt!399388)))))

(assert (=> d!86556 (or (= (bvand lt!399384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399384 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399384 lt!399388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86556 (= lt!399388 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12224 (_2!11972 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12219 (_2!11972 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!399385 () (_ BitVec 64))

(declare-fun lt!399389 () (_ BitVec 64))

(assert (=> d!86556 (= lt!399384 (bvmul lt!399385 lt!399389))))

(assert (=> d!86556 (or (= lt!399385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399389 (bvsdiv (bvmul lt!399385 lt!399389) lt!399385)))))

(assert (=> d!86556 (= lt!399389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86556 (= lt!399385 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86556 (= lt!399387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 (_2!11972 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 (_2!11972 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86556 (invariant!0 (currentBit!12219 (_2!11972 (increaseBitIndex!0 thiss!1754))) (currentByte!12224 (_2!11972 (increaseBitIndex!0 thiss!1754))) (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86556 (= (bitIndex!0 (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754)))) (currentByte!12224 (_2!11972 (increaseBitIndex!0 thiss!1754))) (currentBit!12219 (_2!11972 (increaseBitIndex!0 thiss!1754)))) lt!399387)))

(declare-fun b!257959 () Bool)

(declare-fun res!216143 () Bool)

(assert (=> b!257959 (=> (not res!216143) (not e!178902))))

(assert (=> b!257959 (= res!216143 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399387))))

(declare-fun b!257960 () Bool)

(declare-fun lt!399386 () (_ BitVec 64))

(assert (=> b!257960 (= e!178902 (bvsle lt!399387 (bvmul lt!399386 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257960 (or (= lt!399386 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399386 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399386)))))

(assert (=> b!257960 (= lt!399386 ((_ sign_extend 32) (size!6151 (buf!6673 (_2!11972 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86556 res!216142) b!257959))

(assert (= (and b!257959 res!216143) b!257960))

(declare-fun m!387487 () Bool)

(assert (=> d!86556 m!387487))

(declare-fun m!387489 () Bool)

(assert (=> d!86556 m!387489))

(assert (=> b!257779 d!86556))

(assert (=> b!257779 d!86544))

(declare-fun d!86558 () Bool)

(declare-fun e!178903 () Bool)

(assert (=> d!86558 e!178903))

(declare-fun res!216144 () Bool)

(assert (=> d!86558 (=> (not res!216144) (not e!178903))))

(declare-fun lt!399393 () (_ BitVec 64))

(declare-fun lt!399390 () (_ BitVec 64))

(declare-fun lt!399394 () (_ BitVec 64))

(assert (=> d!86558 (= res!216144 (= lt!399393 (bvsub lt!399390 lt!399394)))))

(assert (=> d!86558 (or (= (bvand lt!399390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399390 lt!399394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86558 (= lt!399394 (remainingBits!0 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))) ((_ sign_extend 32) (currentByte!12224 thiss!1754)) ((_ sign_extend 32) (currentBit!12219 thiss!1754))))))

(declare-fun lt!399391 () (_ BitVec 64))

(declare-fun lt!399395 () (_ BitVec 64))

(assert (=> d!86558 (= lt!399390 (bvmul lt!399391 lt!399395))))

(assert (=> d!86558 (or (= lt!399391 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399395 (bvsdiv (bvmul lt!399391 lt!399395) lt!399391)))))

(assert (=> d!86558 (= lt!399395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86558 (= lt!399391 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))))))

(assert (=> d!86558 (= lt!399393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12224 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12219 thiss!1754))))))

(assert (=> d!86558 (invariant!0 (currentBit!12219 thiss!1754) (currentByte!12224 thiss!1754) (size!6151 (buf!6673 thiss!1754)))))

(assert (=> d!86558 (= (bitIndex!0 (size!6151 (buf!6673 thiss!1754)) (currentByte!12224 thiss!1754) (currentBit!12219 thiss!1754)) lt!399393)))

(declare-fun b!257961 () Bool)

(declare-fun res!216145 () Bool)

(assert (=> b!257961 (=> (not res!216145) (not e!178903))))

(assert (=> b!257961 (= res!216145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399393))))

(declare-fun b!257962 () Bool)

(declare-fun lt!399392 () (_ BitVec 64))

(assert (=> b!257962 (= e!178903 (bvsle lt!399393 (bvmul lt!399392 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257962 (or (= lt!399392 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399392 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399392)))))

(assert (=> b!257962 (= lt!399392 ((_ sign_extend 32) (size!6151 (buf!6673 thiss!1754))))))

(assert (= (and d!86558 res!216144) b!257961))

(assert (= (and b!257961 res!216145) b!257962))

(assert (=> d!86558 m!387343))

(assert (=> d!86558 m!387277))

(assert (=> b!257779 d!86558))

(push 1)

(assert (not b!257945))

(assert (not d!86552))

(assert (not b!257942))

(assert (not d!86536))

(assert (not d!86538))

(assert (not d!86550))

(assert (not b!257950))

(assert (not b!257952))

(assert (not d!86534))

(assert (not d!86542))

(assert (not d!86540))

(assert (not d!86546))

(assert (not d!86556))

(assert (not b!257947))

(assert (not d!86544))

(assert (not b!257948))

(assert (not d!86532))

(assert (not d!86558))

(assert (not b!257957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

