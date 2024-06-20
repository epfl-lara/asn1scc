; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64412 () Bool)

(assert start!64412)

(declare-fun b!289010 () Bool)

(declare-fun e!205535 () Bool)

(declare-fun e!205533 () Bool)

(assert (=> b!289010 (= e!205535 e!205533)))

(declare-fun res!238805 () Bool)

(assert (=> b!289010 (=> (not res!238805) (not e!205533))))

(declare-datatypes ((array!17079 0))(
  ( (array!17080 (arr!8382 (Array (_ BitVec 32) (_ BitVec 8))) (size!7386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12782 0))(
  ( (BitStream!12783 (buf!7452 array!17079) (currentByte!13847 (_ BitVec 32)) (currentBit!13842 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12782)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((tuple2!22630 0))(
  ( (tuple2!22631 (_1!12509 Bool) (_2!12509 BitStream!12782)) )
))
(declare-fun lt!418927 () tuple2!22630)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289010 (= res!238805 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7386 (buf!7452 thiss!1728)) (size!7386 (buf!7452 (_2!12509 lt!418927))))))))

(declare-fun readBit!0 (BitStream!12782) tuple2!22630)

(assert (=> b!289010 (= lt!418927 (readBit!0 thiss!1728))))

(declare-fun res!238807 () Bool)

(assert (=> start!64412 (=> (not res!238807) (not e!205535))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17079)

(assert (=> start!64412 (= res!238807 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7386 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64412 e!205535))

(declare-fun e!205532 () Bool)

(declare-fun inv!12 (BitStream!12782) Bool)

(assert (=> start!64412 (and (inv!12 thiss!1728) e!205532)))

(assert (=> start!64412 true))

(declare-fun array_inv!6998 (array!17079) Bool)

(assert (=> start!64412 (array_inv!6998 arr!273)))

(declare-fun b!289011 () Bool)

(assert (=> b!289011 (= e!205532 (array_inv!6998 (buf!7452 thiss!1728)))))

(declare-fun b!289012 () Bool)

(declare-fun res!238808 () Bool)

(assert (=> b!289012 (=> (not res!238808) (not e!205535))))

(assert (=> b!289012 (= res!238808 (bvslt from!505 to!474))))

(declare-fun b!289013 () Bool)

(assert (=> b!289013 (= e!205533 false)))

(declare-fun lt!418928 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289013 (= lt!418928 (bitIndex!0 (size!7386 (buf!7452 (_2!12509 lt!418927))) (currentByte!13847 (_2!12509 lt!418927)) (currentBit!13842 (_2!12509 lt!418927))))))

(declare-fun lt!418929 () (_ BitVec 64))

(assert (=> b!289013 (= lt!418929 (bitIndex!0 (size!7386 (buf!7452 thiss!1728)) (currentByte!13847 thiss!1728) (currentBit!13842 thiss!1728)))))

(declare-fun b!289014 () Bool)

(declare-fun res!238806 () Bool)

(assert (=> b!289014 (=> (not res!238806) (not e!205535))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289014 (= res!238806 (validate_offset_bits!1 ((_ sign_extend 32) (size!7386 (buf!7452 thiss!1728))) ((_ sign_extend 32) (currentByte!13847 thiss!1728)) ((_ sign_extend 32) (currentBit!13842 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64412 res!238807) b!289014))

(assert (= (and b!289014 res!238806) b!289012))

(assert (= (and b!289012 res!238808) b!289010))

(assert (= (and b!289010 res!238805) b!289013))

(assert (= start!64412 b!289011))

(declare-fun m!421733 () Bool)

(assert (=> b!289011 m!421733))

(declare-fun m!421735 () Bool)

(assert (=> b!289010 m!421735))

(declare-fun m!421737 () Bool)

(assert (=> b!289013 m!421737))

(declare-fun m!421739 () Bool)

(assert (=> b!289013 m!421739))

(declare-fun m!421741 () Bool)

(assert (=> start!64412 m!421741))

(declare-fun m!421743 () Bool)

(assert (=> start!64412 m!421743))

(declare-fun m!421745 () Bool)

(assert (=> b!289014 m!421745))

(push 1)

