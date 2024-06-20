; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65208 () Bool)

(assert start!65208)

(declare-fun b!292591 () Bool)

(declare-fun e!208751 () Bool)

(declare-fun e!208755 () Bool)

(assert (=> b!292591 (= e!208751 (not e!208755))))

(declare-fun res!241657 () Bool)

(assert (=> b!292591 (=> res!241657 e!208755)))

(declare-fun lt!424893 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!292591 (= res!241657 (not (= (bvsub (bvadd lt!424893 to!474) from!505) lt!424893)))))

(declare-datatypes ((array!17413 0))(
  ( (array!17414 (arr!8567 (Array (_ BitVec 32) (_ BitVec 8))) (size!7541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13092 0))(
  ( (BitStream!13093 (buf!7607 array!17413) (currentByte!14062 (_ BitVec 32)) (currentBit!14057 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13092)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292591 (= lt!424893 (bitIndex!0 (size!7541 (buf!7607 thiss!1728)) (currentByte!14062 thiss!1728) (currentBit!14057 thiss!1728)))))

(declare-fun arr!273 () array!17413)

(declare-fun arrayBitRangesEq!0 (array!17413 array!17413 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292591 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424890 () (_ BitVec 64))

(declare-datatypes ((Unit!20371 0))(
  ( (Unit!20372) )
))
(declare-fun lt!424892 () Unit!20371)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17413 array!17413 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20371)

(assert (=> b!292591 (= lt!424892 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424890 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292591 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424890)))

(assert (=> b!292591 (= lt!424890 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7541 arr!273))))))

(declare-fun lt!424891 () Unit!20371)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17413) Unit!20371)

(assert (=> b!292591 (= lt!424891 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292592 () Bool)

(declare-fun res!241661 () Bool)

(assert (=> b!292592 (=> (not res!241661) (not e!208751))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292592 (= res!241661 (validate_offset_bits!1 ((_ sign_extend 32) (size!7541 (buf!7607 thiss!1728))) ((_ sign_extend 32) (currentByte!14062 thiss!1728)) ((_ sign_extend 32) (currentBit!14057 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292594 () Bool)

(declare-fun e!208754 () Bool)

(declare-fun array_inv!7153 (array!17413) Bool)

(assert (=> b!292594 (= e!208754 (array_inv!7153 (buf!7607 thiss!1728)))))

(declare-fun b!292595 () Bool)

(declare-fun res!241660 () Bool)

(assert (=> b!292595 (=> res!241660 e!208755)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!292595 (= res!241660 (not (invariant!0 (currentBit!14057 thiss!1728) (currentByte!14062 thiss!1728) (size!7541 (buf!7607 thiss!1728)))))))

(declare-fun b!292596 () Bool)

(declare-fun res!241658 () Bool)

(assert (=> b!292596 (=> (not res!241658) (not e!208751))))

(assert (=> b!292596 (= res!241658 (bvsge from!505 to!474))))

(declare-fun res!241659 () Bool)

(assert (=> start!65208 (=> (not res!241659) (not e!208751))))

(assert (=> start!65208 (= res!241659 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7541 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65208 e!208751))

(declare-fun inv!12 (BitStream!13092) Bool)

(assert (=> start!65208 (and (inv!12 thiss!1728) e!208754)))

(assert (=> start!65208 true))

(assert (=> start!65208 (array_inv!7153 arr!273)))

(declare-fun b!292593 () Bool)

(assert (=> b!292593 (= e!208755 (bvslt from!505 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!474 from!505))))))

(assert (= (and start!65208 res!241659) b!292592))

(assert (= (and b!292592 res!241661) b!292596))

(assert (= (and b!292596 res!241658) b!292591))

(assert (= (and b!292591 (not res!241657)) b!292595))

(assert (= (and b!292595 (not res!241660)) b!292593))

(assert (= start!65208 b!292594))

(declare-fun m!428169 () Bool)

(assert (=> start!65208 m!428169))

(declare-fun m!428171 () Bool)

(assert (=> start!65208 m!428171))

(declare-fun m!428173 () Bool)

(assert (=> b!292592 m!428173))

(declare-fun m!428175 () Bool)

(assert (=> b!292591 m!428175))

(declare-fun m!428177 () Bool)

(assert (=> b!292591 m!428177))

(declare-fun m!428179 () Bool)

(assert (=> b!292591 m!428179))

(declare-fun m!428181 () Bool)

(assert (=> b!292591 m!428181))

(declare-fun m!428183 () Bool)

(assert (=> b!292591 m!428183))

(declare-fun m!428185 () Bool)

(assert (=> b!292594 m!428185))

(declare-fun m!428187 () Bool)

(assert (=> b!292595 m!428187))

(check-sat (not start!65208) (not b!292591) (not b!292592) (not b!292594) (not b!292595))
(check-sat)
