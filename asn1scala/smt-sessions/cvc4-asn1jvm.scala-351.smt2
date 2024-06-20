; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8270 () Bool)

(assert start!8270)

(declare-fun b!41301 () Bool)

(declare-fun e!27352 () Bool)

(assert (=> b!41301 (= e!27352 true)))

(declare-datatypes ((array!2073 0))(
  ( (array!2074 (arr!1435 (Array (_ BitVec 32) (_ BitVec 8))) (size!936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1616 0))(
  ( (BitStream!1617 (buf!1264 array!2073) (currentByte!2707 (_ BitVec 32)) (currentBit!2702 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3966 0))(
  ( (tuple2!3967 (_1!2070 array!2073) (_2!2070 BitStream!1616)) )
))
(declare-fun lt!62544 () tuple2!3966)

(declare-fun thiss!1379 () BitStream!1616)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!1616 (_ BitVec 64)) tuple2!3966)

(declare-datatypes ((tuple2!3968 0))(
  ( (tuple2!3969 (_1!2071 BitStream!1616) (_2!2071 BitStream!1616)) )
))
(declare-fun reader!0 (BitStream!1616 BitStream!1616) tuple2!3968)

(assert (=> b!41301 (= lt!62544 (readBits!0 (_1!2071 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41302 () Bool)

(declare-fun res!35140 () Bool)

(assert (=> b!41302 (=> res!35140 e!27352)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41302 (= res!35140 (not (invariant!0 (currentBit!2702 thiss!1379) (currentByte!2707 thiss!1379) (size!936 (buf!1264 thiss!1379)))))))

(declare-fun b!41303 () Bool)

(declare-fun e!27354 () Bool)

(declare-fun array_inv!861 (array!2073) Bool)

(assert (=> b!41303 (= e!27354 (array_inv!861 (buf!1264 thiss!1379)))))

(declare-fun res!35142 () Bool)

(declare-fun e!27355 () Bool)

(assert (=> start!8270 (=> (not res!35142) (not e!27355))))

(declare-fun srcBuffer!2 () array!2073)

(assert (=> start!8270 (= res!35142 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!936 srcBuffer!2))))))))

(assert (=> start!8270 e!27355))

(assert (=> start!8270 true))

(assert (=> start!8270 (array_inv!861 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1616) Bool)

(assert (=> start!8270 (and (inv!12 thiss!1379) e!27354)))

(declare-fun b!41304 () Bool)

(assert (=> b!41304 (= e!27355 (not e!27352))))

(declare-fun res!35139 () Bool)

(assert (=> b!41304 (=> res!35139 e!27352)))

(declare-fun lt!62543 () (_ BitVec 64))

(assert (=> b!41304 (= res!35139 (or (bvslt i!635 to!314) (not (= lt!62543 (bvsub (bvadd lt!62543 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1616 BitStream!1616) Bool)

(assert (=> b!41304 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2920 0))(
  ( (Unit!2921) )
))
(declare-fun lt!62545 () Unit!2920)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1616) Unit!2920)

(assert (=> b!41304 (= lt!62545 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41304 (= lt!62543 (bitIndex!0 (size!936 (buf!1264 thiss!1379)) (currentByte!2707 thiss!1379) (currentBit!2702 thiss!1379)))))

(declare-fun b!41305 () Bool)

(declare-fun res!35141 () Bool)

(assert (=> b!41305 (=> (not res!35141) (not e!27355))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41305 (= res!35141 (validate_offset_bits!1 ((_ sign_extend 32) (size!936 (buf!1264 thiss!1379))) ((_ sign_extend 32) (currentByte!2707 thiss!1379)) ((_ sign_extend 32) (currentBit!2702 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8270 res!35142) b!41305))

(assert (= (and b!41305 res!35141) b!41304))

(assert (= (and b!41304 (not res!35139)) b!41302))

(assert (= (and b!41302 (not res!35140)) b!41301))

(assert (= start!8270 b!41303))

(declare-fun m!62987 () Bool)

(assert (=> b!41303 m!62987))

(declare-fun m!62989 () Bool)

(assert (=> b!41305 m!62989))

(declare-fun m!62991 () Bool)

(assert (=> b!41302 m!62991))

(declare-fun m!62993 () Bool)

(assert (=> start!8270 m!62993))

(declare-fun m!62995 () Bool)

(assert (=> start!8270 m!62995))

(declare-fun m!62997 () Bool)

(assert (=> b!41301 m!62997))

(declare-fun m!62999 () Bool)

(assert (=> b!41301 m!62999))

(declare-fun m!63001 () Bool)

(assert (=> b!41304 m!63001))

(declare-fun m!63003 () Bool)

(assert (=> b!41304 m!63003))

(declare-fun m!63005 () Bool)

(assert (=> b!41304 m!63005))

(push 1)

(assert (not start!8270))

(assert (not b!41304))

