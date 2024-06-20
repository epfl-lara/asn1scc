; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65202 () Bool)

(assert start!65202)

(declare-fun res!241622 () Bool)

(declare-fun e!208711 () Bool)

(assert (=> start!65202 (=> (not res!241622) (not e!208711))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17407 0))(
  ( (array!17408 (arr!8564 (Array (_ BitVec 32) (_ BitVec 8))) (size!7538 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17407)

(assert (=> start!65202 (= res!241622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7538 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65202 e!208711))

(declare-datatypes ((BitStream!13086 0))(
  ( (BitStream!13087 (buf!7604 array!17407) (currentByte!14059 (_ BitVec 32)) (currentBit!14054 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13086)

(declare-fun e!208710 () Bool)

(declare-fun inv!12 (BitStream!13086) Bool)

(assert (=> start!65202 (and (inv!12 thiss!1728) e!208710)))

(assert (=> start!65202 true))

(declare-fun array_inv!7150 (array!17407) Bool)

(assert (=> start!65202 (array_inv!7150 arr!273)))

(declare-fun b!292547 () Bool)

(assert (=> b!292547 (= e!208711 (not true))))

(declare-fun lt!424857 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292547 (= lt!424857 (bitIndex!0 (size!7538 (buf!7604 thiss!1728)) (currentByte!14059 thiss!1728) (currentBit!14054 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17407 array!17407 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292547 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20365 0))(
  ( (Unit!20366) )
))
(declare-fun lt!424854 () Unit!20365)

(declare-fun lt!424856 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17407 array!17407 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20365)

(assert (=> b!292547 (= lt!424854 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424856 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292547 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424856)))

(assert (=> b!292547 (= lt!424856 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7538 arr!273))))))

(declare-fun lt!424855 () Unit!20365)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17407) Unit!20365)

(assert (=> b!292547 (= lt!424855 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292546 () Bool)

(declare-fun res!241620 () Bool)

(assert (=> b!292546 (=> (not res!241620) (not e!208711))))

(assert (=> b!292546 (= res!241620 (bvsge from!505 to!474))))

(declare-fun b!292548 () Bool)

(assert (=> b!292548 (= e!208710 (array_inv!7150 (buf!7604 thiss!1728)))))

(declare-fun b!292545 () Bool)

(declare-fun res!241621 () Bool)

(assert (=> b!292545 (=> (not res!241621) (not e!208711))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292545 (= res!241621 (validate_offset_bits!1 ((_ sign_extend 32) (size!7538 (buf!7604 thiss!1728))) ((_ sign_extend 32) (currentByte!14059 thiss!1728)) ((_ sign_extend 32) (currentBit!14054 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65202 res!241622) b!292545))

(assert (= (and b!292545 res!241621) b!292546))

(assert (= (and b!292546 res!241620) b!292547))

(assert (= start!65202 b!292548))

(declare-fun m!428113 () Bool)

(assert (=> start!65202 m!428113))

(declare-fun m!428115 () Bool)

(assert (=> start!65202 m!428115))

(declare-fun m!428117 () Bool)

(assert (=> b!292547 m!428117))

(declare-fun m!428119 () Bool)

(assert (=> b!292547 m!428119))

(declare-fun m!428121 () Bool)

(assert (=> b!292547 m!428121))

(declare-fun m!428123 () Bool)

(assert (=> b!292547 m!428123))

(declare-fun m!428125 () Bool)

(assert (=> b!292547 m!428125))

(declare-fun m!428127 () Bool)

(assert (=> b!292548 m!428127))

(declare-fun m!428129 () Bool)

(assert (=> b!292545 m!428129))

(check-sat (not b!292548) (not b!292547) (not b!292545) (not start!65202))
