; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17758 () Bool)

(assert start!17758)

(declare-fun b!85989 () Bool)

(declare-fun res!70598 () Bool)

(declare-fun e!57237 () Bool)

(assert (=> b!85989 (=> (not res!70598) (not e!57237))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85989 (= res!70598 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85990 () Bool)

(declare-fun res!70606 () Bool)

(assert (=> b!85990 (=> (not res!70606) (not e!57237))))

(declare-datatypes ((array!4083 0))(
  ( (array!4084 (arr!2481 (Array (_ BitVec 32) (_ BitVec 8))) (size!1844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3250 0))(
  ( (BitStream!3251 (buf!2234 array!4083) (currentByte!4440 (_ BitVec 32)) (currentBit!4435 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3250)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85990 (= res!70606 (invariant!0 (currentBit!4435 thiss!1152) (currentByte!4440 thiss!1152) (size!1844 (buf!2234 thiss!1152))))))

(declare-fun b!85991 () Bool)

(declare-fun res!70609 () Bool)

(declare-fun e!57230 () Bool)

(assert (=> b!85991 (=> (not res!70609) (not e!57230))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85991 (= res!70609 (bvslt i!576 nBits!336))))

(declare-fun b!85992 () Bool)

(declare-fun res!70603 () Bool)

(assert (=> b!85992 (=> (not res!70603) (not e!57230))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85992 (= res!70603 (validate_offset_bits!1 ((_ sign_extend 32) (size!1844 (buf!2234 thiss!1152))) ((_ sign_extend 32) (currentByte!4440 thiss!1152)) ((_ sign_extend 32) (currentBit!4435 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85993 () Bool)

(declare-fun res!70602 () Bool)

(assert (=> b!85993 (=> (not res!70602) (not e!57237))))

(declare-fun thiss!1151 () BitStream!3250)

(assert (=> b!85993 (= res!70602 (invariant!0 (currentBit!4435 thiss!1151) (currentByte!4440 thiss!1151) (size!1844 (buf!2234 thiss!1151))))))

(declare-fun b!85994 () Bool)

(declare-fun e!57232 () Bool)

(assert (=> b!85994 (= e!57232 true)))

(declare-fun v!179 () (_ BitVec 64))

(declare-datatypes ((Unit!5704 0))(
  ( (Unit!5705) )
))
(declare-datatypes ((tuple3!388 0))(
  ( (tuple3!389 (_1!3871 Unit!5704) (_2!3871 BitStream!3250) (_3!218 (_ BitVec 32))) )
))
(declare-fun lt!134976 () tuple3!388)

(declare-datatypes ((tuple2!7306 0))(
  ( (tuple2!7307 (_1!3872 Unit!5704) (_2!3872 BitStream!3250)) )
))
(declare-fun lt!134978 () tuple2!7306)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3250 (_ BitVec 64) BitStream!3250 (_ BitVec 32)) tuple3!388)

(assert (=> b!85994 (= lt!134976 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3872 lt!134978) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!85995 () Bool)

(declare-fun e!57228 () Bool)

(declare-fun e!57236 () Bool)

(assert (=> b!85995 (= e!57228 e!57236)))

(declare-fun res!70601 () Bool)

(assert (=> b!85995 (=> (not res!70601) (not e!57236))))

(declare-datatypes ((tuple2!7308 0))(
  ( (tuple2!7309 (_1!3873 BitStream!3250) (_2!3873 Bool)) )
))
(declare-fun lt!134982 () tuple2!7308)

(declare-fun lt!134980 () Bool)

(assert (=> b!85995 (= res!70601 (and (= (_2!3873 lt!134982) lt!134980) (= (_1!3873 lt!134982) (_2!3872 lt!134978))))))

(declare-fun readBitPure!0 (BitStream!3250) tuple2!7308)

(declare-fun readerFrom!0 (BitStream!3250 (_ BitVec 32) (_ BitVec 32)) BitStream!3250)

(assert (=> b!85995 (= lt!134982 (readBitPure!0 (readerFrom!0 (_2!3872 lt!134978) (currentBit!4435 thiss!1152) (currentByte!4440 thiss!1152))))))

(declare-fun res!70612 () Bool)

(assert (=> start!17758 (=> (not res!70612) (not e!57237))))

(assert (=> start!17758 (= res!70612 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17758 e!57237))

(declare-fun e!57234 () Bool)

(declare-fun inv!12 (BitStream!3250) Bool)

(assert (=> start!17758 (and (inv!12 thiss!1152) e!57234)))

(declare-fun e!57233 () Bool)

(assert (=> start!17758 (and (inv!12 thiss!1151) e!57233)))

(assert (=> start!17758 true))

(declare-fun b!85996 () Bool)

(assert (=> b!85996 (= e!57237 e!57230)))

(declare-fun res!70607 () Bool)

(assert (=> b!85996 (=> (not res!70607) (not e!57230))))

(declare-fun lt!134981 () (_ BitVec 64))

(declare-fun lt!134977 () (_ BitVec 64))

(assert (=> b!85996 (= res!70607 (= lt!134977 (bvadd lt!134981 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85996 (= lt!134977 (bitIndex!0 (size!1844 (buf!2234 thiss!1152)) (currentByte!4440 thiss!1152) (currentBit!4435 thiss!1152)))))

(assert (=> b!85996 (= lt!134981 (bitIndex!0 (size!1844 (buf!2234 thiss!1151)) (currentByte!4440 thiss!1151) (currentBit!4435 thiss!1151)))))

(declare-fun b!85997 () Bool)

(declare-fun res!70611 () Bool)

(assert (=> b!85997 (=> (not res!70611) (not e!57228))))

(declare-fun isPrefixOf!0 (BitStream!3250 BitStream!3250) Bool)

(assert (=> b!85997 (= res!70611 (isPrefixOf!0 thiss!1152 (_2!3872 lt!134978)))))

(declare-fun b!85998 () Bool)

(declare-fun res!70600 () Bool)

(assert (=> b!85998 (=> res!70600 e!57232)))

(assert (=> b!85998 (= res!70600 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85999 () Bool)

(declare-fun e!57231 () Bool)

(assert (=> b!85999 (= e!57231 e!57228)))

(declare-fun res!70610 () Bool)

(assert (=> b!85999 (=> (not res!70610) (not e!57228))))

(declare-fun lt!134979 () (_ BitVec 64))

(assert (=> b!85999 (= res!70610 (= lt!134979 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134977)))))

(assert (=> b!85999 (= lt!134979 (bitIndex!0 (size!1844 (buf!2234 (_2!3872 lt!134978))) (currentByte!4440 (_2!3872 lt!134978)) (currentBit!4435 (_2!3872 lt!134978))))))

(declare-fun b!86000 () Bool)

(declare-fun res!70599 () Bool)

(assert (=> b!86000 (=> (not res!70599) (not e!57237))))

(assert (=> b!86000 (= res!70599 (and (bvsle i!576 nBits!336) (= (size!1844 (buf!2234 thiss!1152)) (size!1844 (buf!2234 thiss!1151)))))))

(declare-fun b!86001 () Bool)

(declare-fun res!70608 () Bool)

(assert (=> b!86001 (=> (not res!70608) (not e!57237))))

(assert (=> b!86001 (= res!70608 (validate_offset_bits!1 ((_ sign_extend 32) (size!1844 (buf!2234 thiss!1151))) ((_ sign_extend 32) (currentByte!4440 thiss!1151)) ((_ sign_extend 32) (currentBit!4435 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86002 () Bool)

(assert (=> b!86002 (= e!57230 (not e!57232))))

(declare-fun res!70605 () Bool)

(assert (=> b!86002 (=> res!70605 e!57232)))

(assert (=> b!86002 (= res!70605 (not (invariant!0 (currentBit!4435 (_2!3872 lt!134978)) (currentByte!4440 (_2!3872 lt!134978)) (size!1844 (buf!2234 (_2!3872 lt!134978))))))))

(assert (=> b!86002 e!57231))

(declare-fun res!70604 () Bool)

(assert (=> b!86002 (=> (not res!70604) (not e!57231))))

(assert (=> b!86002 (= res!70604 (= (size!1844 (buf!2234 thiss!1152)) (size!1844 (buf!2234 (_2!3872 lt!134978)))))))

(declare-fun appendBit!0 (BitStream!3250 Bool) tuple2!7306)

(assert (=> b!86002 (= lt!134978 (appendBit!0 thiss!1152 lt!134980))))

(assert (=> b!86002 (= lt!134980 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86003 () Bool)

(declare-fun array_inv!1690 (array!4083) Bool)

(assert (=> b!86003 (= e!57234 (array_inv!1690 (buf!2234 thiss!1152)))))

(declare-fun b!86004 () Bool)

(assert (=> b!86004 (= e!57236 (= (bitIndex!0 (size!1844 (buf!2234 (_1!3873 lt!134982))) (currentByte!4440 (_1!3873 lt!134982)) (currentBit!4435 (_1!3873 lt!134982))) lt!134979))))

(declare-fun b!86005 () Bool)

(assert (=> b!86005 (= e!57233 (array_inv!1690 (buf!2234 thiss!1151)))))

(assert (= (and start!17758 res!70612) b!86001))

(assert (= (and b!86001 res!70608) b!85993))

(assert (= (and b!85993 res!70602) b!85989))

(assert (= (and b!85989 res!70598) b!85990))

(assert (= (and b!85990 res!70606) b!86000))

(assert (= (and b!86000 res!70599) b!85996))

(assert (= (and b!85996 res!70607) b!85992))

(assert (= (and b!85992 res!70603) b!85991))

(assert (= (and b!85991 res!70609) b!86002))

(assert (= (and b!86002 res!70604) b!85999))

(assert (= (and b!85999 res!70610) b!85997))

(assert (= (and b!85997 res!70611) b!85995))

(assert (= (and b!85995 res!70601) b!86004))

(assert (= (and b!86002 (not res!70605)) b!85998))

(assert (= (and b!85998 (not res!70600)) b!85994))

(assert (= start!17758 b!86003))

(assert (= start!17758 b!86005))

(declare-fun m!131981 () Bool)

(assert (=> b!85997 m!131981))

(declare-fun m!131983 () Bool)

(assert (=> b!85990 m!131983))

(declare-fun m!131985 () Bool)

(assert (=> b!85996 m!131985))

(declare-fun m!131987 () Bool)

(assert (=> b!85996 m!131987))

(declare-fun m!131989 () Bool)

(assert (=> start!17758 m!131989))

(declare-fun m!131991 () Bool)

(assert (=> start!17758 m!131991))

(declare-fun m!131993 () Bool)

(assert (=> b!86003 m!131993))

(declare-fun m!131995 () Bool)

(assert (=> b!86002 m!131995))

(declare-fun m!131997 () Bool)

(assert (=> b!86002 m!131997))

(declare-fun m!131999 () Bool)

(assert (=> b!86001 m!131999))

(declare-fun m!132001 () Bool)

(assert (=> b!85993 m!132001))

(declare-fun m!132003 () Bool)

(assert (=> b!86005 m!132003))

(declare-fun m!132005 () Bool)

(assert (=> b!85992 m!132005))

(declare-fun m!132007 () Bool)

(assert (=> b!85994 m!132007))

(declare-fun m!132009 () Bool)

(assert (=> b!85999 m!132009))

(declare-fun m!132011 () Bool)

(assert (=> b!85995 m!132011))

(assert (=> b!85995 m!132011))

(declare-fun m!132013 () Bool)

(assert (=> b!85995 m!132013))

(declare-fun m!132015 () Bool)

(assert (=> b!86004 m!132015))

(push 1)

(assert (not b!86002))

(assert (not b!85990))

(assert (not b!85993))

(assert (not b!86004))

(assert (not b!86003))

(assert (not b!85999))

(assert (not start!17758))

(assert (not b!85994))

(assert (not b!86005))

(assert (not b!85995))

(assert (not b!85996))

(assert (not b!85997))

(assert (not b!85992))

(assert (not b!86001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

