; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18100 () Bool)

(assert start!18100)

(declare-fun b!89039 () Bool)

(declare-fun res!73309 () Bool)

(declare-fun e!58859 () Bool)

(assert (=> b!89039 (=> (not res!73309) (not e!58859))))

(declare-datatypes ((array!4206 0))(
  ( (array!4207 (arr!2535 (Array (_ BitVec 32) (_ BitVec 8))) (size!1898 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3358 0))(
  ( (BitStream!3359 (buf!2288 array!4206) (currentByte!4542 (_ BitVec 32)) (currentBit!4537 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3358)

(declare-fun thiss!1151 () BitStream!3358)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89039 (= res!73309 (and (bvsle i!576 nBits!336) (= (size!1898 (buf!2288 thiss!1152)) (size!1898 (buf!2288 thiss!1151)))))))

(declare-fun b!89040 () Bool)

(declare-fun res!73318 () Bool)

(declare-fun e!58853 () Bool)

(assert (=> b!89040 (=> (not res!73318) (not e!58853))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89040 (= res!73318 (validate_offset_bits!1 ((_ sign_extend 32) (size!1898 (buf!2288 thiss!1152))) ((_ sign_extend 32) (currentByte!4542 thiss!1152)) ((_ sign_extend 32) (currentBit!4537 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun res!73306 () Bool)

(assert (=> start!18100 (=> (not res!73306) (not e!58859))))

(assert (=> start!18100 (= res!73306 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18100 e!58859))

(declare-fun e!58858 () Bool)

(declare-fun inv!12 (BitStream!3358) Bool)

(assert (=> start!18100 (and (inv!12 thiss!1152) e!58858)))

(declare-fun e!58855 () Bool)

(assert (=> start!18100 (and (inv!12 thiss!1151) e!58855)))

(assert (=> start!18100 true))

(declare-fun b!89041 () Bool)

(assert (=> b!89041 (= e!58853 (not (or (not (= (bvand i!576 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!576 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)))))))

(declare-fun e!58852 () Bool)

(assert (=> b!89041 e!58852))

(declare-fun res!73313 () Bool)

(assert (=> b!89041 (=> (not res!73313) (not e!58852))))

(declare-datatypes ((Unit!5779 0))(
  ( (Unit!5780) )
))
(declare-datatypes ((tuple2!7468 0))(
  ( (tuple2!7469 (_1!3967 Unit!5779) (_2!3967 BitStream!3358)) )
))
(declare-fun lt!136371 () tuple2!7468)

(assert (=> b!89041 (= res!73313 (= (size!1898 (buf!2288 thiss!1152)) (size!1898 (buf!2288 (_2!3967 lt!136371)))))))

(declare-fun lt!136373 () Bool)

(declare-fun appendBit!0 (BitStream!3358 Bool) tuple2!7468)

(assert (=> b!89041 (= lt!136371 (appendBit!0 thiss!1152 lt!136373))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89041 (= lt!136373 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89042 () Bool)

(declare-fun res!73316 () Bool)

(assert (=> b!89042 (=> (not res!73316) (not e!58859))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89042 (= res!73316 (invariant!0 (currentBit!4537 thiss!1152) (currentByte!4542 thiss!1152) (size!1898 (buf!2288 thiss!1152))))))

(declare-fun b!89043 () Bool)

(declare-fun e!58856 () Bool)

(declare-datatypes ((tuple2!7470 0))(
  ( (tuple2!7471 (_1!3968 BitStream!3358) (_2!3968 Bool)) )
))
(declare-fun lt!136369 () tuple2!7470)

(declare-fun lt!136372 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89043 (= e!58856 (= (bitIndex!0 (size!1898 (buf!2288 (_1!3968 lt!136369))) (currentByte!4542 (_1!3968 lt!136369)) (currentBit!4537 (_1!3968 lt!136369))) lt!136372))))

(declare-fun b!89044 () Bool)

(declare-fun e!58854 () Bool)

(assert (=> b!89044 (= e!58854 e!58856)))

(declare-fun res!73312 () Bool)

(assert (=> b!89044 (=> (not res!73312) (not e!58856))))

(assert (=> b!89044 (= res!73312 (and (= (_2!3968 lt!136369) lt!136373) (= (_1!3968 lt!136369) (_2!3967 lt!136371))))))

(declare-fun readBitPure!0 (BitStream!3358) tuple2!7470)

(declare-fun readerFrom!0 (BitStream!3358 (_ BitVec 32) (_ BitVec 32)) BitStream!3358)

(assert (=> b!89044 (= lt!136369 (readBitPure!0 (readerFrom!0 (_2!3967 lt!136371) (currentBit!4537 thiss!1152) (currentByte!4542 thiss!1152))))))

(declare-fun b!89045 () Bool)

(declare-fun res!73317 () Bool)

(assert (=> b!89045 (=> (not res!73317) (not e!58853))))

(assert (=> b!89045 (= res!73317 (bvslt i!576 nBits!336))))

(declare-fun b!89046 () Bool)

(assert (=> b!89046 (= e!58859 e!58853)))

(declare-fun res!73308 () Bool)

(assert (=> b!89046 (=> (not res!73308) (not e!58853))))

(declare-fun lt!136370 () (_ BitVec 64))

(declare-fun lt!136374 () (_ BitVec 64))

(assert (=> b!89046 (= res!73308 (= lt!136374 (bvadd lt!136370 ((_ sign_extend 32) i!576))))))

(assert (=> b!89046 (= lt!136374 (bitIndex!0 (size!1898 (buf!2288 thiss!1152)) (currentByte!4542 thiss!1152) (currentBit!4537 thiss!1152)))))

(assert (=> b!89046 (= lt!136370 (bitIndex!0 (size!1898 (buf!2288 thiss!1151)) (currentByte!4542 thiss!1151) (currentBit!4537 thiss!1151)))))

(declare-fun b!89047 () Bool)

(declare-fun res!73315 () Bool)

(assert (=> b!89047 (=> (not res!73315) (not e!58854))))

(declare-fun isPrefixOf!0 (BitStream!3358 BitStream!3358) Bool)

(assert (=> b!89047 (= res!73315 (isPrefixOf!0 thiss!1152 (_2!3967 lt!136371)))))

(declare-fun b!89048 () Bool)

(declare-fun array_inv!1744 (array!4206) Bool)

(assert (=> b!89048 (= e!58858 (array_inv!1744 (buf!2288 thiss!1152)))))

(declare-fun b!89049 () Bool)

(assert (=> b!89049 (= e!58855 (array_inv!1744 (buf!2288 thiss!1151)))))

(declare-fun b!89050 () Bool)

(assert (=> b!89050 (= e!58852 e!58854)))

(declare-fun res!73307 () Bool)

(assert (=> b!89050 (=> (not res!73307) (not e!58854))))

(assert (=> b!89050 (= res!73307 (= lt!136372 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136374)))))

(assert (=> b!89050 (= lt!136372 (bitIndex!0 (size!1898 (buf!2288 (_2!3967 lt!136371))) (currentByte!4542 (_2!3967 lt!136371)) (currentBit!4537 (_2!3967 lt!136371))))))

(declare-fun b!89051 () Bool)

(declare-fun res!73311 () Bool)

(assert (=> b!89051 (=> (not res!73311) (not e!58859))))

(assert (=> b!89051 (= res!73311 (invariant!0 (currentBit!4537 thiss!1151) (currentByte!4542 thiss!1151) (size!1898 (buf!2288 thiss!1151))))))

(declare-fun b!89052 () Bool)

(declare-fun res!73314 () Bool)

(assert (=> b!89052 (=> (not res!73314) (not e!58859))))

(assert (=> b!89052 (= res!73314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1898 (buf!2288 thiss!1151))) ((_ sign_extend 32) (currentByte!4542 thiss!1151)) ((_ sign_extend 32) (currentBit!4537 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89053 () Bool)

(declare-fun res!73310 () Bool)

(assert (=> b!89053 (=> (not res!73310) (not e!58859))))

(assert (=> b!89053 (= res!73310 (bvsge i!576 #b00000000000000000000000000000000))))

(assert (= (and start!18100 res!73306) b!89052))

(assert (= (and b!89052 res!73314) b!89051))

(assert (= (and b!89051 res!73311) b!89053))

(assert (= (and b!89053 res!73310) b!89042))

(assert (= (and b!89042 res!73316) b!89039))

(assert (= (and b!89039 res!73309) b!89046))

(assert (= (and b!89046 res!73308) b!89040))

(assert (= (and b!89040 res!73318) b!89045))

(assert (= (and b!89045 res!73317) b!89041))

(assert (= (and b!89041 res!73313) b!89050))

(assert (= (and b!89050 res!73307) b!89047))

(assert (= (and b!89047 res!73315) b!89044))

(assert (= (and b!89044 res!73312) b!89043))

(assert (= start!18100 b!89048))

(assert (= start!18100 b!89049))

(declare-fun m!133997 () Bool)

(assert (=> b!89040 m!133997))

(declare-fun m!133999 () Bool)

(assert (=> b!89050 m!133999))

(declare-fun m!134001 () Bool)

(assert (=> b!89042 m!134001))

(declare-fun m!134003 () Bool)

(assert (=> b!89051 m!134003))

(declare-fun m!134005 () Bool)

(assert (=> b!89044 m!134005))

(assert (=> b!89044 m!134005))

(declare-fun m!134007 () Bool)

(assert (=> b!89044 m!134007))

(declare-fun m!134009 () Bool)

(assert (=> b!89052 m!134009))

(declare-fun m!134011 () Bool)

(assert (=> b!89046 m!134011))

(declare-fun m!134013 () Bool)

(assert (=> b!89046 m!134013))

(declare-fun m!134015 () Bool)

(assert (=> b!89043 m!134015))

(declare-fun m!134017 () Bool)

(assert (=> b!89047 m!134017))

(declare-fun m!134019 () Bool)

(assert (=> b!89041 m!134019))

(declare-fun m!134021 () Bool)

(assert (=> b!89048 m!134021))

(declare-fun m!134023 () Bool)

(assert (=> start!18100 m!134023))

(declare-fun m!134025 () Bool)

(assert (=> start!18100 m!134025))

(declare-fun m!134027 () Bool)

(assert (=> b!89049 m!134027))

(push 1)

(assert (not b!89050))

(assert (not b!89044))

(assert (not b!89040))

(assert (not start!18100))

(assert (not b!89047))

(assert (not b!89048))

(assert (not b!89049))

(assert (not b!89042))

(assert (not b!89043))

(assert (not b!89046))

(assert (not b!89051))

(assert (not b!89041))

(assert (not b!89052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

