; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4770 () Bool)

(assert start!4770)

(declare-fun b!18869 () Bool)

(declare-fun e!12299 () Bool)

(declare-fun e!12297 () Bool)

(assert (=> b!18869 (= e!12299 (not e!12297))))

(declare-fun res!16509 () Bool)

(assert (=> b!18869 (=> res!16509 e!12297)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!18869 (= res!16509 (bvsge i!635 to!314))))

(declare-datatypes ((array!1333 0))(
  ( (array!1334 (arr!1004 (Array (_ BitVec 32) (_ BitVec 8))) (size!563 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!960 0))(
  ( (BitStream!961 (buf!863 array!1333) (currentByte!2134 (_ BitVec 32)) (currentBit!2129 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!960)

(declare-fun isPrefixOf!0 (BitStream!960 BitStream!960) Bool)

(assert (=> b!18869 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1670 0))(
  ( (Unit!1671) )
))
(declare-fun lt!26948 () Unit!1670)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!960) Unit!1670)

(assert (=> b!18869 (= lt!26948 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26949 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18869 (= lt!26949 (bitIndex!0 (size!563 (buf!863 thiss!1379)) (currentByte!2134 thiss!1379) (currentBit!2129 thiss!1379)))))

(declare-fun b!18870 () Bool)

(declare-fun e!12295 () Bool)

(declare-fun array_inv!533 (array!1333) Bool)

(assert (=> b!18870 (= e!12295 (array_inv!533 (buf!863 thiss!1379)))))

(declare-fun res!16511 () Bool)

(assert (=> start!4770 (=> (not res!16511) (not e!12299))))

(declare-fun srcBuffer!2 () array!1333)

(assert (=> start!4770 (= res!16511 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!563 srcBuffer!2))))))))

(assert (=> start!4770 e!12299))

(assert (=> start!4770 true))

(assert (=> start!4770 (array_inv!533 srcBuffer!2)))

(declare-fun inv!12 (BitStream!960) Bool)

(assert (=> start!4770 (and (inv!12 thiss!1379) e!12295)))

(declare-fun b!18868 () Bool)

(declare-fun res!16510 () Bool)

(assert (=> b!18868 (=> (not res!16510) (not e!12299))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18868 (= res!16510 (validate_offset_bits!1 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18871 () Bool)

(declare-fun e!12300 () Bool)

(assert (=> b!18871 (= e!12297 e!12300)))

(declare-fun res!16508 () Bool)

(assert (=> b!18871 (=> res!16508 e!12300)))

(declare-fun lt!26950 () (_ BitVec 32))

(assert (=> b!18871 (= res!16508 (or (bvslt lt!26950 #b00000000000000000000000000000000) (bvsge lt!26950 #b00000000000000000000000000001000)))))

(assert (=> b!18871 (= lt!26950 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!18872 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18872 (= e!12300 (validate_offset_bit!0 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379))))))

(assert (= (and start!4770 res!16511) b!18868))

(assert (= (and b!18868 res!16510) b!18869))

(assert (= (and b!18869 (not res!16509)) b!18871))

(assert (= (and b!18871 (not res!16508)) b!18872))

(assert (= start!4770 b!18870))

(declare-fun m!25339 () Bool)

(assert (=> b!18872 m!25339))

(declare-fun m!25341 () Bool)

(assert (=> start!4770 m!25341))

(declare-fun m!25343 () Bool)

(assert (=> start!4770 m!25343))

(declare-fun m!25345 () Bool)

(assert (=> b!18869 m!25345))

(declare-fun m!25347 () Bool)

(assert (=> b!18869 m!25347))

(declare-fun m!25349 () Bool)

(assert (=> b!18869 m!25349))

(declare-fun m!25351 () Bool)

(assert (=> b!18868 m!25351))

(declare-fun m!25353 () Bool)

(assert (=> b!18870 m!25353))

(check-sat (not start!4770) (not b!18872) (not b!18870) (not b!18869) (not b!18868))
(check-sat)
(get-model)

(declare-fun d!6264 () Bool)

(assert (=> d!6264 (= (array_inv!533 (buf!863 thiss!1379)) (bvsge (size!563 (buf!863 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18870 d!6264))

(declare-fun d!6266 () Bool)

(declare-fun res!16530 () Bool)

(declare-fun e!12324 () Bool)

(assert (=> d!6266 (=> (not res!16530) (not e!12324))))

(assert (=> d!6266 (= res!16530 (= (size!563 (buf!863 thiss!1379)) (size!563 (buf!863 thiss!1379))))))

(assert (=> d!6266 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12324)))

(declare-fun b!18894 () Bool)

(declare-fun res!16532 () Bool)

(assert (=> b!18894 (=> (not res!16532) (not e!12324))))

(assert (=> b!18894 (= res!16532 (bvsle (bitIndex!0 (size!563 (buf!863 thiss!1379)) (currentByte!2134 thiss!1379) (currentBit!2129 thiss!1379)) (bitIndex!0 (size!563 (buf!863 thiss!1379)) (currentByte!2134 thiss!1379) (currentBit!2129 thiss!1379))))))

(declare-fun b!18895 () Bool)

(declare-fun e!12323 () Bool)

(assert (=> b!18895 (= e!12324 e!12323)))

(declare-fun res!16531 () Bool)

(assert (=> b!18895 (=> res!16531 e!12323)))

(assert (=> b!18895 (= res!16531 (= (size!563 (buf!863 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!18896 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1333 array!1333 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18896 (= e!12323 (arrayBitRangesEq!0 (buf!863 thiss!1379) (buf!863 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!563 (buf!863 thiss!1379)) (currentByte!2134 thiss!1379) (currentBit!2129 thiss!1379))))))

(assert (= (and d!6266 res!16530) b!18894))

(assert (= (and b!18894 res!16532) b!18895))

(assert (= (and b!18895 (not res!16531)) b!18896))

(assert (=> b!18894 m!25349))

(assert (=> b!18894 m!25349))

(assert (=> b!18896 m!25349))

(assert (=> b!18896 m!25349))

(declare-fun m!25371 () Bool)

(assert (=> b!18896 m!25371))

(assert (=> b!18869 d!6266))

(declare-fun d!6268 () Bool)

(assert (=> d!6268 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!26962 () Unit!1670)

(declare-fun choose!11 (BitStream!960) Unit!1670)

(assert (=> d!6268 (= lt!26962 (choose!11 thiss!1379))))

(assert (=> d!6268 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!26962)))

(declare-fun bs!1812 () Bool)

(assert (= bs!1812 d!6268))

(assert (=> bs!1812 m!25345))

(declare-fun m!25373 () Bool)

(assert (=> bs!1812 m!25373))

(assert (=> b!18869 d!6268))

(declare-fun d!6270 () Bool)

(declare-fun e!12327 () Bool)

(assert (=> d!6270 e!12327))

(declare-fun res!16537 () Bool)

(assert (=> d!6270 (=> (not res!16537) (not e!12327))))

(declare-fun lt!26980 () (_ BitVec 64))

(declare-fun lt!26976 () (_ BitVec 64))

(declare-fun lt!26979 () (_ BitVec 64))

(assert (=> d!6270 (= res!16537 (= lt!26979 (bvsub lt!26976 lt!26980)))))

(assert (=> d!6270 (or (= (bvand lt!26976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26976 lt!26980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6270 (= lt!26980 (remainingBits!0 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379))))))

(declare-fun lt!26977 () (_ BitVec 64))

(declare-fun lt!26975 () (_ BitVec 64))

(assert (=> d!6270 (= lt!26976 (bvmul lt!26977 lt!26975))))

(assert (=> d!6270 (or (= lt!26977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!26975 (bvsdiv (bvmul lt!26977 lt!26975) lt!26977)))))

(assert (=> d!6270 (= lt!26975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6270 (= lt!26977 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))))))

(assert (=> d!6270 (= lt!26979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2134 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2129 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6270 (invariant!0 (currentBit!2129 thiss!1379) (currentByte!2134 thiss!1379) (size!563 (buf!863 thiss!1379)))))

(assert (=> d!6270 (= (bitIndex!0 (size!563 (buf!863 thiss!1379)) (currentByte!2134 thiss!1379) (currentBit!2129 thiss!1379)) lt!26979)))

(declare-fun b!18901 () Bool)

(declare-fun res!16538 () Bool)

(assert (=> b!18901 (=> (not res!16538) (not e!12327))))

(assert (=> b!18901 (= res!16538 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!26979))))

(declare-fun b!18902 () Bool)

(declare-fun lt!26978 () (_ BitVec 64))

(assert (=> b!18902 (= e!12327 (bvsle lt!26979 (bvmul lt!26978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18902 (or (= lt!26978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!26978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!26978)))))

(assert (=> b!18902 (= lt!26978 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))))))

(assert (= (and d!6270 res!16537) b!18901))

(assert (= (and b!18901 res!16538) b!18902))

(declare-fun m!25375 () Bool)

(assert (=> d!6270 m!25375))

(declare-fun m!25377 () Bool)

(assert (=> d!6270 m!25377))

(assert (=> b!18869 d!6270))

(declare-fun d!6274 () Bool)

(assert (=> d!6274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1813 () Bool)

(assert (= bs!1813 d!6274))

(assert (=> bs!1813 m!25375))

(assert (=> b!18868 d!6274))

(declare-fun d!6278 () Bool)

(assert (=> d!6278 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!563 (buf!863 thiss!1379))) ((_ sign_extend 32) (currentByte!2134 thiss!1379)) ((_ sign_extend 32) (currentBit!2129 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1815 () Bool)

(assert (= bs!1815 d!6278))

(assert (=> bs!1815 m!25375))

(assert (=> b!18872 d!6278))

(declare-fun d!6282 () Bool)

(assert (=> d!6282 (= (array_inv!533 srcBuffer!2) (bvsge (size!563 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4770 d!6282))

(declare-fun d!6284 () Bool)

(assert (=> d!6284 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2129 thiss!1379) (currentByte!2134 thiss!1379) (size!563 (buf!863 thiss!1379))))))

(declare-fun bs!1816 () Bool)

(assert (= bs!1816 d!6284))

(assert (=> bs!1816 m!25377))

(assert (=> start!4770 d!6284))

(check-sat (not d!6284) (not d!6274) (not d!6278) (not d!6268) (not d!6270) (not b!18896) (not b!18894))
(check-sat)
