; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29322 () Bool)

(assert start!29322)

(declare-fun b!151978 () Bool)

(declare-fun e!101592 () Bool)

(declare-fun lt!237996 () (_ BitVec 64))

(assert (=> b!151978 (= e!101592 (bvsge lt!237996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!6781 0))(
  ( (array!6782 (arr!3885 (Array (_ BitVec 32) (_ BitVec 8))) (size!3068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5394 0))(
  ( (BitStream!5395 (buf!3565 array!6781) (currentByte!6497 (_ BitVec 32)) (currentBit!6492 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13530 0))(
  ( (tuple2!13531 (_1!7140 BitStream!5394) (_2!7140 BitStream!5394)) )
))
(declare-fun lt!237997 () tuple2!13530)

(declare-fun thiss!1634 () BitStream!5394)

(declare-fun reader!0 (BitStream!5394 BitStream!5394) tuple2!13530)

(assert (=> b!151978 (= lt!237997 (reader!0 thiss!1634 thiss!1634))))

(declare-fun res!127440 () Bool)

(declare-fun e!101588 () Bool)

(assert (=> start!29322 (=> (not res!127440) (not e!101588))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6781)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!29322 (= res!127440 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3068 arr!237))))))

(assert (=> start!29322 e!101588))

(assert (=> start!29322 true))

(declare-fun array_inv!2857 (array!6781) Bool)

(assert (=> start!29322 (array_inv!2857 arr!237)))

(declare-fun e!101590 () Bool)

(declare-fun inv!12 (BitStream!5394) Bool)

(assert (=> start!29322 (and (inv!12 thiss!1634) e!101590)))

(declare-fun b!151979 () Bool)

(declare-fun res!127439 () Bool)

(assert (=> b!151979 (=> (not res!127439) (not e!101588))))

(assert (=> b!151979 (= res!127439 (bvsge from!447 to!404))))

(declare-fun b!151980 () Bool)

(assert (=> b!151980 (= e!101588 (not e!101592))))

(declare-fun res!127438 () Bool)

(assert (=> b!151980 (=> res!127438 e!101592)))

(declare-fun lt!237994 () (_ BitVec 64))

(assert (=> b!151980 (= res!127438 (not (= lt!237994 (bvadd lt!237994 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!237996)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151980 (= lt!237994 (bitIndex!0 (size!3068 (buf!3565 thiss!1634)) (currentByte!6497 thiss!1634) (currentBit!6492 thiss!1634)))))

(assert (=> b!151980 (= lt!237996 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5394 BitStream!5394) Bool)

(assert (=> b!151980 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9648 0))(
  ( (Unit!9649) )
))
(declare-fun lt!237995 () Unit!9648)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5394) Unit!9648)

(assert (=> b!151980 (= lt!237995 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151981 () Bool)

(assert (=> b!151981 (= e!101590 (array_inv!2857 (buf!3565 thiss!1634)))))

(declare-fun b!151982 () Bool)

(declare-fun res!127437 () Bool)

(assert (=> b!151982 (=> (not res!127437) (not e!101588))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151982 (= res!127437 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3068 (buf!3565 thiss!1634))) ((_ sign_extend 32) (currentByte!6497 thiss!1634)) ((_ sign_extend 32) (currentBit!6492 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29322 res!127440) b!151982))

(assert (= (and b!151982 res!127437) b!151979))

(assert (= (and b!151979 res!127439) b!151980))

(assert (= (and b!151980 (not res!127438)) b!151978))

(assert (= start!29322 b!151981))

(declare-fun m!237695 () Bool)

(assert (=> b!151981 m!237695))

(declare-fun m!237697 () Bool)

(assert (=> b!151978 m!237697))

(declare-fun m!237699 () Bool)

(assert (=> b!151982 m!237699))

(declare-fun m!237701 () Bool)

(assert (=> start!29322 m!237701))

(declare-fun m!237703 () Bool)

(assert (=> start!29322 m!237703))

(declare-fun m!237705 () Bool)

(assert (=> b!151980 m!237705))

(declare-fun m!237707 () Bool)

(assert (=> b!151980 m!237707))

(declare-fun m!237709 () Bool)

(assert (=> b!151980 m!237709))

(check-sat (not start!29322) (not b!151980) (not b!151981) (not b!151978) (not b!151982))
(check-sat)
