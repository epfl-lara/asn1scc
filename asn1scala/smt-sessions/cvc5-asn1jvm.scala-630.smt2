; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17764 () Bool)

(assert start!17764)

(declare-fun b!86150 () Bool)

(declare-fun res!70744 () Bool)

(declare-fun e!57327 () Bool)

(assert (=> b!86150 (=> res!70744 e!57327)))

(declare-datatypes ((array!4089 0))(
  ( (array!4090 (arr!2484 (Array (_ BitVec 32) (_ BitVec 8))) (size!1847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3256 0))(
  ( (BitStream!3257 (buf!2237 array!4089) (currentByte!4443 (_ BitVec 32)) (currentBit!4438 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3256)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-datatypes ((Unit!5710 0))(
  ( (Unit!5711) )
))
(declare-datatypes ((tuple3!394 0))(
  ( (tuple3!395 (_1!3880 Unit!5710) (_2!3880 BitStream!3256) (_3!221 (_ BitVec 32))) )
))
(declare-fun lt!135042 () tuple3!394)

(assert (=> b!86150 (= res!70744 (or (bvsgt (_3!221 lt!135042) nBits!336) (not (= (size!1847 (buf!2237 (_2!3880 lt!135042))) (size!1847 (buf!2237 thiss!1151))))))))

(declare-fun b!86151 () Bool)

(declare-fun res!70755 () Bool)

(declare-fun e!57328 () Bool)

(assert (=> b!86151 (=> (not res!70755) (not e!57328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86151 (= res!70755 (validate_offset_bits!1 ((_ sign_extend 32) (size!1847 (buf!2237 thiss!1151))) ((_ sign_extend 32) (currentByte!4443 thiss!1151)) ((_ sign_extend 32) (currentBit!4438 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86152 () Bool)

(declare-fun res!70753 () Bool)

(assert (=> b!86152 (=> res!70753 e!57327)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86152 (= res!70753 (not (invariant!0 (currentBit!4438 (_2!3880 lt!135042)) (currentByte!4443 (_2!3880 lt!135042)) (size!1847 (buf!2237 (_2!3880 lt!135042))))))))

(declare-fun b!86153 () Bool)

(declare-fun e!57323 () Bool)

(assert (=> b!86153 (= e!57328 e!57323)))

(declare-fun res!70752 () Bool)

(assert (=> b!86153 (=> (not res!70752) (not e!57323))))

(declare-fun lt!135041 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135044 () (_ BitVec 64))

(assert (=> b!86153 (= res!70752 (= lt!135044 (bvadd lt!135041 ((_ sign_extend 32) i!576))))))

(declare-fun thiss!1152 () BitStream!3256)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86153 (= lt!135044 (bitIndex!0 (size!1847 (buf!2237 thiss!1152)) (currentByte!4443 thiss!1152) (currentBit!4438 thiss!1152)))))

(assert (=> b!86153 (= lt!135041 (bitIndex!0 (size!1847 (buf!2237 thiss!1151)) (currentByte!4443 thiss!1151) (currentBit!4438 thiss!1151)))))

(declare-fun b!86154 () Bool)

(declare-fun e!57322 () Bool)

(declare-fun e!57326 () Bool)

(assert (=> b!86154 (= e!57322 e!57326)))

(declare-fun res!70751 () Bool)

(assert (=> b!86154 (=> (not res!70751) (not e!57326))))

(declare-fun lt!135043 () (_ BitVec 64))

(assert (=> b!86154 (= res!70751 (= lt!135043 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135044)))))

(declare-datatypes ((tuple2!7318 0))(
  ( (tuple2!7319 (_1!3881 Unit!5710) (_2!3881 BitStream!3256)) )
))
(declare-fun lt!135040 () tuple2!7318)

(assert (=> b!86154 (= lt!135043 (bitIndex!0 (size!1847 (buf!2237 (_2!3881 lt!135040))) (currentByte!4443 (_2!3881 lt!135040)) (currentBit!4438 (_2!3881 lt!135040))))))

(declare-fun b!86155 () Bool)

(declare-fun e!57330 () Bool)

(assert (=> b!86155 (= e!57330 e!57327)))

(declare-fun res!70745 () Bool)

(assert (=> b!86155 (=> res!70745 e!57327)))

(assert (=> b!86155 (= res!70745 (bvslt (_3!221 lt!135042) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3256 (_ BitVec 64) BitStream!3256 (_ BitVec 32)) tuple3!394)

(assert (=> b!86155 (= lt!135042 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3881 lt!135040) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86157 () Bool)

(declare-fun e!57320 () Bool)

(declare-datatypes ((tuple2!7320 0))(
  ( (tuple2!7321 (_1!3882 BitStream!3256) (_2!3882 Bool)) )
))
(declare-fun lt!135045 () tuple2!7320)

(assert (=> b!86157 (= e!57320 (= (bitIndex!0 (size!1847 (buf!2237 (_1!3882 lt!135045))) (currentByte!4443 (_1!3882 lt!135045)) (currentBit!4438 (_1!3882 lt!135045))) lt!135043))))

(declare-fun b!86158 () Bool)

(assert (=> b!86158 (= e!57323 (not e!57330))))

(declare-fun res!70754 () Bool)

(assert (=> b!86158 (=> res!70754 e!57330)))

(assert (=> b!86158 (= res!70754 (not (invariant!0 (currentBit!4438 (_2!3881 lt!135040)) (currentByte!4443 (_2!3881 lt!135040)) (size!1847 (buf!2237 (_2!3881 lt!135040))))))))

(assert (=> b!86158 e!57322))

(declare-fun res!70750 () Bool)

(assert (=> b!86158 (=> (not res!70750) (not e!57322))))

(assert (=> b!86158 (= res!70750 (= (size!1847 (buf!2237 thiss!1152)) (size!1847 (buf!2237 (_2!3881 lt!135040)))))))

(declare-fun lt!135039 () Bool)

(declare-fun appendBit!0 (BitStream!3256 Bool) tuple2!7318)

(assert (=> b!86158 (= lt!135040 (appendBit!0 thiss!1152 lt!135039))))

(assert (=> b!86158 (= lt!135039 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86159 () Bool)

(declare-fun e!57325 () Bool)

(declare-fun array_inv!1693 (array!4089) Bool)

(assert (=> b!86159 (= e!57325 (array_inv!1693 (buf!2237 thiss!1151)))))

(declare-fun b!86160 () Bool)

(declare-fun res!70748 () Bool)

(assert (=> b!86160 (=> (not res!70748) (not e!57326))))

(declare-fun isPrefixOf!0 (BitStream!3256 BitStream!3256) Bool)

(assert (=> b!86160 (= res!70748 (isPrefixOf!0 thiss!1152 (_2!3881 lt!135040)))))

(declare-fun b!86161 () Bool)

(assert (=> b!86161 (= e!57327 (and (bvsle ((_ sign_extend 32) (size!1847 (buf!2237 (_2!3880 lt!135042)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4443 (_2!3880 lt!135042))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4438 (_2!3880 lt!135042))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!86162 () Bool)

(declare-fun res!70756 () Bool)

(assert (=> b!86162 (=> (not res!70756) (not e!57323))))

(assert (=> b!86162 (= res!70756 (bvslt i!576 nBits!336))))

(declare-fun b!86163 () Bool)

(declare-fun res!70747 () Bool)

(assert (=> b!86163 (=> (not res!70747) (not e!57323))))

(assert (=> b!86163 (= res!70747 (validate_offset_bits!1 ((_ sign_extend 32) (size!1847 (buf!2237 thiss!1152))) ((_ sign_extend 32) (currentByte!4443 thiss!1152)) ((_ sign_extend 32) (currentBit!4438 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86164 () Bool)

(declare-fun e!57329 () Bool)

(assert (=> b!86164 (= e!57329 (array_inv!1693 (buf!2237 thiss!1152)))))

(declare-fun b!86165 () Bool)

(declare-fun res!70743 () Bool)

(assert (=> b!86165 (=> (not res!70743) (not e!57328))))

(assert (=> b!86165 (= res!70743 (invariant!0 (currentBit!4438 thiss!1151) (currentByte!4443 thiss!1151) (size!1847 (buf!2237 thiss!1151))))))

(declare-fun b!86166 () Bool)

(declare-fun res!70759 () Bool)

(assert (=> b!86166 (=> (not res!70759) (not e!57328))))

(assert (=> b!86166 (= res!70759 (and (bvsle i!576 nBits!336) (= (size!1847 (buf!2237 thiss!1152)) (size!1847 (buf!2237 thiss!1151)))))))

(declare-fun b!86167 () Bool)

(declare-fun res!70749 () Bool)

(assert (=> b!86167 (=> res!70749 e!57327)))

(assert (=> b!86167 (= res!70749 (not (= (bitIndex!0 (size!1847 (buf!2237 (_2!3880 lt!135042))) (currentByte!4443 (_2!3880 lt!135042)) (currentBit!4438 (_2!3880 lt!135042))) (bvadd lt!135041 ((_ sign_extend 32) (_3!221 lt!135042))))))))

(declare-fun res!70758 () Bool)

(assert (=> start!17764 (=> (not res!70758) (not e!57328))))

(assert (=> start!17764 (= res!70758 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17764 e!57328))

(declare-fun inv!12 (BitStream!3256) Bool)

(assert (=> start!17764 (and (inv!12 thiss!1152) e!57329)))

(assert (=> start!17764 (and (inv!12 thiss!1151) e!57325)))

(assert (=> start!17764 true))

(declare-fun b!86156 () Bool)

(declare-fun res!70741 () Bool)

(assert (=> b!86156 (=> (not res!70741) (not e!57328))))

(assert (=> b!86156 (= res!70741 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86168 () Bool)

(declare-fun res!70757 () Bool)

(assert (=> b!86168 (=> res!70757 e!57330)))

(assert (=> b!86168 (= res!70757 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86169 () Bool)

(assert (=> b!86169 (= e!57326 e!57320)))

(declare-fun res!70746 () Bool)

(assert (=> b!86169 (=> (not res!70746) (not e!57320))))

(assert (=> b!86169 (= res!70746 (and (= (_2!3882 lt!135045) lt!135039) (= (_1!3882 lt!135045) (_2!3881 lt!135040))))))

(declare-fun readBitPure!0 (BitStream!3256) tuple2!7320)

(declare-fun readerFrom!0 (BitStream!3256 (_ BitVec 32) (_ BitVec 32)) BitStream!3256)

(assert (=> b!86169 (= lt!135045 (readBitPure!0 (readerFrom!0 (_2!3881 lt!135040) (currentBit!4438 thiss!1152) (currentByte!4443 thiss!1152))))))

(declare-fun b!86170 () Bool)

(declare-fun res!70742 () Bool)

(assert (=> b!86170 (=> (not res!70742) (not e!57328))))

(assert (=> b!86170 (= res!70742 (invariant!0 (currentBit!4438 thiss!1152) (currentByte!4443 thiss!1152) (size!1847 (buf!2237 thiss!1152))))))

(assert (= (and start!17764 res!70758) b!86151))

(assert (= (and b!86151 res!70755) b!86165))

(assert (= (and b!86165 res!70743) b!86156))

(assert (= (and b!86156 res!70741) b!86170))

(assert (= (and b!86170 res!70742) b!86166))

(assert (= (and b!86166 res!70759) b!86153))

(assert (= (and b!86153 res!70752) b!86163))

(assert (= (and b!86163 res!70747) b!86162))

(assert (= (and b!86162 res!70756) b!86158))

(assert (= (and b!86158 res!70750) b!86154))

(assert (= (and b!86154 res!70751) b!86160))

(assert (= (and b!86160 res!70748) b!86169))

(assert (= (and b!86169 res!70746) b!86157))

(assert (= (and b!86158 (not res!70754)) b!86168))

(assert (= (and b!86168 (not res!70757)) b!86155))

(assert (= (and b!86155 (not res!70745)) b!86152))

(assert (= (and b!86152 (not res!70753)) b!86150))

(assert (= (and b!86150 (not res!70744)) b!86167))

(assert (= (and b!86167 (not res!70749)) b!86161))

(assert (= start!17764 b!86164))

(assert (= start!17764 b!86159))

(declare-fun m!132089 () Bool)

(assert (=> b!86158 m!132089))

(declare-fun m!132091 () Bool)

(assert (=> b!86158 m!132091))

(declare-fun m!132093 () Bool)

(assert (=> b!86153 m!132093))

(declare-fun m!132095 () Bool)

(assert (=> b!86153 m!132095))

(declare-fun m!132097 () Bool)

(assert (=> b!86163 m!132097))

(declare-fun m!132099 () Bool)

(assert (=> b!86152 m!132099))

(declare-fun m!132101 () Bool)

(assert (=> b!86159 m!132101))

(declare-fun m!132103 () Bool)

(assert (=> b!86169 m!132103))

(assert (=> b!86169 m!132103))

(declare-fun m!132105 () Bool)

(assert (=> b!86169 m!132105))

(declare-fun m!132107 () Bool)

(assert (=> b!86164 m!132107))

(declare-fun m!132109 () Bool)

(assert (=> b!86157 m!132109))

(declare-fun m!132111 () Bool)

(assert (=> b!86170 m!132111))

(declare-fun m!132113 () Bool)

(assert (=> start!17764 m!132113))

(declare-fun m!132115 () Bool)

(assert (=> start!17764 m!132115))

(declare-fun m!132117 () Bool)

(assert (=> b!86154 m!132117))

(declare-fun m!132119 () Bool)

(assert (=> b!86165 m!132119))

(declare-fun m!132121 () Bool)

(assert (=> b!86160 m!132121))

(declare-fun m!132123 () Bool)

(assert (=> b!86167 m!132123))

(declare-fun m!132125 () Bool)

(assert (=> b!86151 m!132125))

(declare-fun m!132127 () Bool)

(assert (=> b!86155 m!132127))

(push 1)

(assert (not b!86169))

(assert (not b!86160))

(assert (not b!86170))

(assert (not b!86155))

(assert (not b!86164))

(assert (not start!17764))

(assert (not b!86152))

(assert (not b!86163))

(assert (not b!86158))

(assert (not b!86151))

(assert (not b!86167))

(assert (not b!86157))

(assert (not b!86165))

(assert (not b!86153))

(assert (not b!86154))

(assert (not b!86159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

