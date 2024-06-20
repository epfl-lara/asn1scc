; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10438 () Bool)

(assert start!10438)

(declare-fun res!43767 () Bool)

(declare-fun e!34828 () Bool)

(assert (=> start!10438 (=> (not res!43767) (not e!34828))))

(declare-datatypes ((array!2459 0))(
  ( (array!2460 (arr!1660 (Array (_ BitVec 32) (_ BitVec 8))) (size!1124 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2459)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10438 (= res!43767 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1124 srcBuffer!2))))))))

(assert (=> start!10438 e!34828))

(assert (=> start!10438 true))

(declare-fun array_inv!1029 (array!2459) Bool)

(assert (=> start!10438 (array_inv!1029 srcBuffer!2)))

(declare-datatypes ((BitStream!1940 0))(
  ( (BitStream!1941 (buf!1474 array!2459) (currentByte!3017 (_ BitVec 32)) (currentBit!3012 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1940)

(declare-fun e!34827 () Bool)

(declare-fun inv!12 (BitStream!1940) Bool)

(assert (=> start!10438 (and (inv!12 thiss!1379) e!34827)))

(declare-fun b!52424 () Bool)

(declare-fun res!43766 () Bool)

(assert (=> b!52424 (=> (not res!43766) (not e!34828))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52424 (= res!43766 (validate_offset_bits!1 ((_ sign_extend 32) (size!1124 (buf!1474 thiss!1379))) ((_ sign_extend 32) (currentByte!3017 thiss!1379)) ((_ sign_extend 32) (currentBit!3012 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52425 () Bool)

(assert (=> b!52425 (= e!34828 (not (or (bvsge i!635 to!314) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1940 BitStream!1940) Bool)

(assert (=> b!52425 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3652 0))(
  ( (Unit!3653) )
))
(declare-fun lt!81418 () Unit!3652)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1940) Unit!3652)

(assert (=> b!52425 (= lt!81418 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81417 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52425 (= lt!81417 (bitIndex!0 (size!1124 (buf!1474 thiss!1379)) (currentByte!3017 thiss!1379) (currentBit!3012 thiss!1379)))))

(declare-fun b!52426 () Bool)

(assert (=> b!52426 (= e!34827 (array_inv!1029 (buf!1474 thiss!1379)))))

(assert (= (and start!10438 res!43767) b!52424))

(assert (= (and b!52424 res!43766) b!52425))

(assert (= start!10438 b!52426))

(declare-fun m!82763 () Bool)

(assert (=> start!10438 m!82763))

(declare-fun m!82765 () Bool)

(assert (=> start!10438 m!82765))

(declare-fun m!82767 () Bool)

(assert (=> b!52424 m!82767))

(declare-fun m!82769 () Bool)

(assert (=> b!52425 m!82769))

(declare-fun m!82771 () Bool)

(assert (=> b!52425 m!82771))

(declare-fun m!82773 () Bool)

(assert (=> b!52425 m!82773))

(declare-fun m!82775 () Bool)

(assert (=> b!52426 m!82775))

(push 1)

(assert (not b!52424))

(assert (not b!52425))

(assert (not start!10438))

(assert (not b!52426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

