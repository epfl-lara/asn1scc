; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34986 () Bool)

(assert start!34986)

(declare-fun res!137356 () Bool)

(declare-fun e!113967 () Bool)

(assert (=> start!34986 (=> (not res!137356) (not e!113967))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34986 (= res!137356 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34986 e!113967))

(assert (=> start!34986 true))

(declare-datatypes ((array!8293 0))(
  ( (array!8294 (arr!4629 (Array (_ BitVec 32) (_ BitVec 8))) (size!3708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6572 0))(
  ( (BitStream!6573 (buf!4160 array!8293) (currentByte!7770 (_ BitVec 32)) (currentBit!7765 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6572)

(declare-fun e!113965 () Bool)

(declare-fun inv!12 (BitStream!6572) Bool)

(assert (=> start!34986 (and (inv!12 thiss!1577) e!113965)))

(declare-fun b!164848 () Bool)

(declare-fun res!137357 () Bool)

(assert (=> b!164848 (=> (not res!137357) (not e!113967))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164848 (= res!137357 (validate_offset_bits!1 ((_ sign_extend 32) (size!3708 (buf!4160 thiss!1577))) ((_ sign_extend 32) (currentByte!7770 thiss!1577)) ((_ sign_extend 32) (currentBit!7765 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164849 () Bool)

(assert (=> b!164849 (= e!113967 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7765 thiss!1577))))) #b00000000000000000000000010000000))))

(declare-fun b!164850 () Bool)

(declare-fun array_inv!3449 (array!8293) Bool)

(assert (=> b!164850 (= e!113965 (array_inv!3449 (buf!4160 thiss!1577)))))

(assert (= (and start!34986 res!137356) b!164848))

(assert (= (and b!164848 res!137357) b!164849))

(assert (= start!34986 b!164850))

(declare-fun m!262211 () Bool)

(assert (=> start!34986 m!262211))

(declare-fun m!262213 () Bool)

(assert (=> b!164848 m!262213))

(declare-fun m!262215 () Bool)

(assert (=> b!164849 m!262215))

(declare-fun m!262217 () Bool)

(assert (=> b!164850 m!262217))

(push 1)

(assert (not b!164848))

(assert (not start!34986))

(assert (not b!164850))

(check-sat)

