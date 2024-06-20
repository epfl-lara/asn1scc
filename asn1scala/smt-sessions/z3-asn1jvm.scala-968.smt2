; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27344 () Bool)

(assert start!27344)

(declare-fun b!140305 () Bool)

(declare-fun res!116975 () Bool)

(declare-fun e!93517 () Bool)

(assert (=> b!140305 (=> (not res!116975) (not e!93517))))

(declare-datatypes ((array!6410 0))(
  ( (array!6411 (arr!3607 (Array (_ BitVec 32) (_ BitVec 8))) (size!2900 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5058 0))(
  ( (BitStream!5059 (buf!3321 array!6410) (currentByte!6172 (_ BitVec 32)) (currentBit!6167 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5058)

(declare-datatypes ((Unit!8779 0))(
  ( (Unit!8780) )
))
(declare-datatypes ((tuple2!12274 0))(
  ( (tuple2!12275 (_1!6467 Unit!8779) (_2!6467 BitStream!5058)) )
))
(declare-fun lt!218681 () tuple2!12274)

(declare-fun isPrefixOf!0 (BitStream!5058 BitStream!5058) Bool)

(assert (=> b!140305 (= res!116975 (isPrefixOf!0 thiss!1634 (_2!6467 lt!218681)))))

(declare-fun res!116979 () Bool)

(declare-fun e!93515 () Bool)

(assert (=> start!27344 (=> (not res!116979) (not e!93515))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6410)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27344 (= res!116979 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2900 arr!237))))))

(assert (=> start!27344 e!93515))

(assert (=> start!27344 true))

(declare-fun array_inv!2689 (array!6410) Bool)

(assert (=> start!27344 (array_inv!2689 arr!237)))

(declare-fun e!93519 () Bool)

(declare-fun inv!12 (BitStream!5058) Bool)

(assert (=> start!27344 (and (inv!12 thiss!1634) e!93519)))

(declare-datatypes ((tuple2!12276 0))(
  ( (tuple2!12277 (_1!6468 BitStream!5058) (_2!6468 BitStream!5058)) )
))
(declare-fun lt!218680 () tuple2!12276)

(declare-datatypes ((tuple2!12278 0))(
  ( (tuple2!12279 (_1!6469 BitStream!5058) (_2!6469 (_ BitVec 8))) )
))
(declare-fun lt!218679 () tuple2!12278)

(declare-fun b!140306 () Bool)

(assert (=> b!140306 (= e!93517 (and (= (_2!6469 lt!218679) (select (arr!3607 arr!237) from!447)) (= (_1!6469 lt!218679) (_2!6468 lt!218680))))))

(declare-fun readBytePure!0 (BitStream!5058) tuple2!12278)

(assert (=> b!140306 (= lt!218679 (readBytePure!0 (_1!6468 lt!218680)))))

(declare-fun reader!0 (BitStream!5058 BitStream!5058) tuple2!12276)

(assert (=> b!140306 (= lt!218680 (reader!0 thiss!1634 (_2!6467 lt!218681)))))

(declare-fun b!140307 () Bool)

(assert (=> b!140307 (= e!93515 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140307 e!93517))

(declare-fun res!116974 () Bool)

(assert (=> b!140307 (=> (not res!116974) (not e!93517))))

(assert (=> b!140307 (= res!116974 (= (size!2900 (buf!3321 thiss!1634)) (size!2900 (buf!3321 (_2!6467 lt!218681)))))))

(declare-fun appendByte!0 (BitStream!5058 (_ BitVec 8)) tuple2!12274)

(assert (=> b!140307 (= lt!218681 (appendByte!0 thiss!1634 (select (arr!3607 arr!237) from!447)))))

(declare-fun b!140308 () Bool)

(declare-fun res!116980 () Bool)

(assert (=> b!140308 (=> (not res!116980) (not e!93515))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140308 (= res!116980 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2900 (buf!3321 thiss!1634))) ((_ sign_extend 32) (currentByte!6172 thiss!1634)) ((_ sign_extend 32) (currentBit!6167 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140309 () Bool)

(assert (=> b!140309 (= e!93519 (array_inv!2689 (buf!3321 thiss!1634)))))

(declare-fun b!140310 () Bool)

(declare-fun res!116978 () Bool)

(assert (=> b!140310 (=> (not res!116978) (not e!93515))))

(assert (=> b!140310 (= res!116978 (bvslt from!447 to!404))))

(declare-fun b!140311 () Bool)

(declare-fun res!116977 () Bool)

(assert (=> b!140311 (=> (not res!116977) (not e!93515))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140311 (= res!116977 (invariant!0 (currentBit!6167 thiss!1634) (currentByte!6172 thiss!1634) (size!2900 (buf!3321 thiss!1634))))))

(declare-fun b!140312 () Bool)

(declare-fun res!116976 () Bool)

(assert (=> b!140312 (=> (not res!116976) (not e!93517))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140312 (= res!116976 (= (bitIndex!0 (size!2900 (buf!3321 (_2!6467 lt!218681))) (currentByte!6172 (_2!6467 lt!218681)) (currentBit!6167 (_2!6467 lt!218681))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2900 (buf!3321 thiss!1634)) (currentByte!6172 thiss!1634) (currentBit!6167 thiss!1634)))))))

(assert (= (and start!27344 res!116979) b!140308))

(assert (= (and b!140308 res!116980) b!140310))

(assert (= (and b!140310 res!116978) b!140311))

(assert (= (and b!140311 res!116977) b!140307))

(assert (= (and b!140307 res!116974) b!140312))

(assert (= (and b!140312 res!116976) b!140305))

(assert (= (and b!140305 res!116975) b!140306))

(assert (= start!27344 b!140309))

(declare-fun m!216089 () Bool)

(assert (=> b!140305 m!216089))

(declare-fun m!216091 () Bool)

(assert (=> b!140312 m!216091))

(declare-fun m!216093 () Bool)

(assert (=> b!140312 m!216093))

(declare-fun m!216095 () Bool)

(assert (=> b!140309 m!216095))

(declare-fun m!216097 () Bool)

(assert (=> b!140308 m!216097))

(declare-fun m!216099 () Bool)

(assert (=> start!27344 m!216099))

(declare-fun m!216101 () Bool)

(assert (=> start!27344 m!216101))

(declare-fun m!216103 () Bool)

(assert (=> b!140307 m!216103))

(assert (=> b!140307 m!216103))

(declare-fun m!216105 () Bool)

(assert (=> b!140307 m!216105))

(declare-fun m!216107 () Bool)

(assert (=> b!140311 m!216107))

(assert (=> b!140306 m!216103))

(declare-fun m!216109 () Bool)

(assert (=> b!140306 m!216109))

(declare-fun m!216111 () Bool)

(assert (=> b!140306 m!216111))

(check-sat (not start!27344) (not b!140312) (not b!140308) (not b!140305) (not b!140306) (not b!140311) (not b!140307) (not b!140309))
